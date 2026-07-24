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
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/plan/data/plan_providers.dart';
import 'features/plan/presentation/screens/loading_screen.dart';
import 'features/plan/presentation/screens/plan_screen.dart';
import 'features/practice/presentation/controller/practice_controller.dart';
import 'features/practice/presentation/screens/practice_screen.dart';
import 'features/practice/presentation/screens/readiness_route.dart';

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
  static const profile = '/profile';
  static const readiness = '/readiness';
  static const practice = '/practice';

  /// Post-onboarding surfaces that require a generated program. Reached on
  /// reload with a live session; if no program exists yet the router diverts to
  /// [generating] to produce one.
  static const requiresPlan = {home, plan, profile, readiness, practice};

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

    // On reload, a signed-in user with a saved profile but no generated program
    // (generation never finished) would otherwise land on an empty /home. Gate
    // the post-onboarding surfaces on the program existing; if it does not,
    // send them to /generating to produce it.
    if (signedIn && Routes.requiresPlan.contains(path)) {
      final hasPlan = ref.read(hasActivePlanProvider);
      // Still checking — hold position rather than flashing /generating.
      if (hasPlan.isLoading) return null;
      // Treat an errored check (offline/401) as "don't divert": better to show
      // the surface's own error than to loop into generation on a flaky network.
      if (hasPlan.value == false) return Routes.generating;
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
    GoRoute(path: Routes.profile, builder: (_, _) => const ProfileScreen()),
    GoRoute(path: Routes.readiness, builder: (_, _) => const ReadinessRoute()),
    // A real session derives its own mode from the loaded exercises (set vs
    // cardio) in `loadExecution`; this `initialMode` only seeds the offline/demo
    // path, which has no loaded session. `?mode=cardio` forces the cardio surface
    // there.
    GoRoute(
      path: Routes.practice,
      builder: (context, state) => PracticeScreen(
        initialMode: state.uri.queryParameters['mode'] == 'cardio'
            ? PracticeMode.cardio
            : PracticeMode.set,
      ),
    ),
  ],
);

/// Bridges the providers the redirect reads to go_router, which wants a
/// [Listenable]. Re-runs the redirect when the session appears/disappears, or
/// when the "has a plan?" check resolves (so the reload gate stops holding).
class _AuthListenable extends ChangeNotifier {
  _AuthListenable(Ref ref) {
    _authSub = ref.listen(
      authProvider,
      (_, _) => notifyListeners(),
      fireImmediately: false,
    );
    _planSub = ref.listen(
      hasActivePlanProvider,
      (_, _) => notifyListeners(),
      fireImmediately: false,
    );
    // ref.listen's subscription is closed with the provider container, but the
    // router outlives individual routes — close them explicitly on dispose.
  }

  late final ProviderSubscription<Object?> _authSub;
  late final ProviderSubscription<Object?> _planSub;

  @override
  void dispose() {
    _authSub.close();
    _planSub.close();
    super.dispose();
  }
}
