import 'package:go_router/go_router.dart';

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

/// Route paths, in flow order.
abstract final class Routes {
  static const account = '/';
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
GoRouter createRouter() => GoRouter(
  initialLocation: Routes.home,
  routes: [
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
