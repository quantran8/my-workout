import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/tokens.dart';
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

  /// The six steps that show the progress hairline, in order.
  static const onboardingSteps = [story, basics, safety, context, diet, review];

  /// Fill fraction for [path], or null on screens without the hairline.
  ///
  /// Steps are 1-based over six: the first step already shows 1/6 of progress,
  /// and review fills the bar completely.
  static double? progressFor(String path) {
    final index = onboardingSteps.indexOf(path);
    return index < 0 ? null : (index + 1) / onboardingSteps.length;
  }
}

GoRouter createRouter() => GoRouter(
  initialLocation: Routes.account,
  routes: [
    _fade(Routes.account, (_) => const AccountGateScreen()),
    _fade(Routes.welcome, (_) => const WelcomeScreen()),
    // No shell: the progress hairline belongs under each screen's own header,
    // so every step renders it through ScreenScaffold.progress instead.
    _fade(Routes.story, (_) => const StoryGoalScreen()),
    _fade(Routes.basics, (_) => const BasicsScreen()),
    _fade(Routes.safety, (_) => const SafetyScreen()),
    _fade(Routes.context, (_) => const ContextScheduleScreen()),
    _fade(Routes.diet, (_) => const DietScreen()),
    _fade(Routes.review, (_) => const RawReviewScreen()),
    _fade(Routes.generating, (_) => const LoadingScreen()),
    _fade(Routes.plan, (_) => const PlanScreen()),
    _fade(Routes.home, (_) => const HomeScreen()),
  ],
);

/// Material's default slide would fight the `screenIn` entrance each screen
/// already plays, so transitions are a plain cross-fade on the same curve.
GoRoute _fade(String path, Widget Function(BuildContext) builder) => GoRoute(
  path: path,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: builder(context),
    transitionDuration: AppMotion.screenIn,
    reverseTransitionDuration: AppMotion.screenIn,
    transitionsBuilder: (context, animation, _, child) => FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: AppMotion.enterCurve),
      child: child,
    ),
  ),
);

