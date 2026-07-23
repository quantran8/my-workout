import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/auth/data/auth_controller.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/onboarding/presentation/screens/account_gate_screen.dart';
import 'features/onboarding/presentation/screens/basics_screen.dart';
import 'features/onboarding/presentation/screens/context_schedule_screen.dart';
import 'features/onboarding/presentation/screens/diet_screen.dart';
import 'features/onboarding/presentation/screens/raw_review_screen.dart';
import 'features/onboarding/presentation/screens/safety_screen.dart';
import 'features/onboarding/presentation/screens/story_goal_screen.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/plan/presentation/screens/loading_screen.dart';
import 'features/plan/presentation/screens/plan_screen.dart';
import 'features/practice/presentation/controller/practice_controller.dart';
import 'features/practice/presentation/screens/practice_screen.dart';

part 'router.g.dart';

/// The app's router. keepAlive so the navigation stack survives rebuilds — and
/// a provider rather than a plain constructor so it gets a [Ref] with which to
/// watch the session.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) => createRouter(ref);

/// Route paths, in flow order.
abstract final class Routes {
  static const account = '/';
  static const login = '/login';
  static const register = '/register';
  static const welcome = '/welcome';
  static const story = '/onboarding/story';
  static const basics = '/onboarding/basics';
  static const safety = '/onboarding/safety';
  static const context = '/onboarding/context';
  static const diet = '/onboarding/diet';
  static const review = '/onboarding/review';
  static const generating = '/generating';
  static const plan = '/plan';
  static const home = '/home';
  static const practice = '/practice';

  /// Reachable without a session. Everything else redirects to [login].
  static const public = {account, login, register};

  /// The six onboarding steps that show the progress hairline, in order.
  static const onboardingSteps = [story, basics, safety, context, diet, review];

  /// The fill value (0..1) for a step's progress hairline, mirroring the
  /// prototype's steps 3–8. Returns null for routes outside the flow, which
  /// [ScreenScaffold] reads as "hide the bar".
  static double? progressFor(String route) {
    final index = onboardingSteps.indexOf(route);
    return index < 0 ? null : index / (onboardingSteps.length - 1);
  }
}

// Plain routes use go_router's default `MaterialPage`, so each platform gets
// its own page transition (iOS slide, Android's platform default). Each screen
// still plays its own `screenIn` entrance on top.
GoRouter createRouter(Ref ref) => GoRouter(
  initialLocation: Routes.login,
  // Re-runs `redirect` whenever the session appears or disappears, so signing
  // out from any screen lands on the login page.
  refreshListenable: _AuthListenable(ref),
  redirect: (context, state) {
    final auth = ref.read(authProvider);
    // Still restoring the persisted session — hold position rather than
    // bouncing to login and back.
    if (auth.isLoading) return null;

    final signedIn = auth.value != null;
    final path = state.matchedLocation;
    final isPublic = Routes.public.contains(path);

    if (!signedIn && !isPublic) return Routes.login;
    // Nothing to do on the auth screens once signed in.
    if (signedIn && (path == Routes.login || path == Routes.register)) {
      return Routes.home;
    }
    return null;
  },
  routes: [
    GoRoute(path: Routes.login, builder: (_, _) => const LoginScreen()),
    GoRoute(path: Routes.register, builder: (_, _) => const RegisterScreen()),
    GoRoute(path: Routes.account, builder: (_, _) => const AccountGateScreen()),
    GoRoute(path: Routes.welcome, builder: (_, _) => const WelcomeScreen()),
    GoRoute(path: Routes.story, builder: (_, _) => const StoryGoalScreen()),
    GoRoute(path: Routes.basics, builder: (_, _) => const BasicsScreen()),
    GoRoute(path: Routes.safety, builder: (_, _) => const SafetyScreen()),
    GoRoute(path: Routes.context, builder: (_, _) => const ContextScheduleScreen()),
    GoRoute(path: Routes.diet, builder: (_, _) => const DietScreen()),
    GoRoute(path: Routes.review, builder: (_, _) => const RawReviewScreen()),
    GoRoute(path: Routes.generating, builder: (_, _) => const LoadingScreen()),
    GoRoute(path: Routes.plan, builder: (_, _) => const PlanScreen()),
    GoRoute(path: Routes.home, builder: (_, _) => const HomeScreen()),
    // `?mode=cardio` opens the cardio surface; anything else opens set mode.
    GoRoute(
      path: Routes.practice,
      builder: (context, state) => PracticeScreen(
        // initialMode: state.uri.queryParameters['mode'] == 'cardio' ? PracticeMode.cardio : PracticeMode.set,
        initialMode: PracticeMode.set,
      ),
    ),
  ],
);

/// Bridges the auth provider to go_router, which wants a [Listenable].
class _AuthListenable extends ChangeNotifier {
  _AuthListenable(Ref ref) {
    _subscription = ref.listen(
      authProvider,
      (_, _) => notifyListeners(),
      fireImmediately: false,
    );
    // ref.listen's subscription is closed with the provider container, but the
    // router outlives individual routes — close it explicitly on dispose.
  }

  late final ProviderSubscription<Object?> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
