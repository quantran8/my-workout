import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/noise_background.dart';
import '../../../../core/widgets/screen_enter.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../../plan/data/plan_providers.dart';
import '../../../plan/models/plan_text.dart';
import '../../../plan/models/workout_plan.dart';
import '../../data/access_controller.dart';
import '../../data/session_log_controller.dart';
import '../../models/progress_report.dart';
import '../../models/session_log.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_metrics.dart';
import '../widgets/progress_card.dart';
import '../widgets/week_strip.dart';

/// Screen 11 — the post-onboarding home dashboard.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final now = ref.watch(nowProvider);
    final log = ref.watch(sessionLogControllerProvider);
    final access = ref.watch(accessProvider);
    // Null while the plan is still generating — every consumer below already
    // falls back, so home renders rather than blocking on it.
    final plan = ref.watch(planProvider).value;

    final locale = Localizations.localeOf(context).toLanguageTag();
    final today = DateTime(now.year, now.month, now.day);

    final due = log.dueAsOf(now);
    final done = log.completedAsOf(now);
    final streak = log.streakAsOf(now);
    final report = ProgressReport.from(log.baselineSessions);

    // The next unfinished training day, which drives the hero card. Null once
    // every scheduled session is logged.
    final next = log.days.where((d) => !d.completed).firstOrNull;
    final isToday = next?.day == today;
    final isTomorrow =
        next?.day == today.add(const Duration(days: 1));

    final session = plan?.sessions.firstOrNull;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NoiseBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: ScreenEnter(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.screenH,
                      8,
                      AppSpacing.screenH,
                      HomeBottomNav.height +
                          MediaQuery.viewPaddingOf(context).bottom +
                          24,
                    ),
                    children: [
                      _Greeting(
                        date: DateFormat.yMMMMEEEEd(locale).format(now),
                        title: t.homeGreeting,
                        onProfile: () => showAppToast(ref, t.homeProfileToast),
                      ),
                      const SizedBox(height: 24),

                      _card(
                        0,
                        _HeroCard(
                          t: t,
                          session: session,
                          state: next == null
                              ? _HeroState.allDone
                              : isToday
                              ? _HeroState.today
                              : isTomorrow
                              ? _HeroState.tomorrow
                              : _HeroState.rest,
                          onStart: () => _start(ref, t, isToday),
                        ),
                      ),

                      const SizedBox(height: 26),
                      _SectionHead(
                        title: t.homeWeekTitle,
                        actionLabel: t.homeWeekPlanLink,
                        onAction: () => context.go(Routes.plan),
                      ),
                      const SizedBox(height: 12),
                      _card(1, WeekStrip(log: log, now: now, t: t)),

                      const SizedBox(height: 26),
                      _card(
                        2,
                        Row(
                          children: [
                            Expanded(
                              child: HomeMetricTile(
                                label: t.homeStreakLabel,
                                value: '$streak',
                                unit: t.homeStreakUnit,
                                caption: t.homeStreakBest(streak),
                                figure: StreakSpark(filled: streak),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: HomeMetricTile(
                                label: t.homeAdherenceLabel,
                                value:
                                    '${(log.adherenceAsOf(now) * 100).round()}',
                                unit: '%',
                                caption: t.homeAdherenceFoot(done, due.length),
                                figure: AdherenceRing(
                                  value: log.adherenceAsOf(now),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 26),
                      _SectionHead(
                        title: t.homeProgressTitle,
                        actionLabel: access == AccessTier.paid
                            ? t.homeProgressProLink
                            : t.homeProgressUpsellLink,
                        onAction: () =>
                            ref.read(accessProvider.notifier).toggle(),
                      ),
                      const SizedBox(height: 12),
                      _card(
                        3,
                        access == AccessTier.paid
                            ? UnlockedProgressCard(report: report, t: t)
                            : LockedProgressCard(
                                report: report,
                                t: t,
                                onUnlock: () =>
                                    showAppToast(ref, t.homeUnlockToast),
                              ),
                      ),

                      const SizedBox(height: 26),
                      _SectionHead(title: t.homeRecentTitle),
                      const SizedBox(height: 12),
                      _card(
                        4,
                        _RecentRow(
                          t: t,
                          log: log,
                          session: session,
                          onTap: () => showAppToast(ref, t.homeRecentToast),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HomeBottomNav(
                currentIndex: 0,
                items: [
                  HomeNavItem(
                    icon: Icons.home_rounded,
                    label: t.homeNavHome,
                    onTap: () {},
                  ),
                  HomeNavItem(
                    icon: Icons.article_outlined,
                    label: t.homeNavPlan,
                    onTap: () => context.go(Routes.plan),
                  ),
                  HomeNavItem(
                    icon: Icons.schedule_rounded,
                    label: t.homeNavLog,
                    onTap: () => showAppToast(ref, t.homeNavToast),
                  ),
                  HomeNavItem(
                    icon: Icons.person_outline_rounded,
                    label: t.homeNavProfile,
                    onTap: () => showAppToast(ref, t.homeNavToast),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _start(WidgetRef ref, AppLocalizations t, bool isToday) {
    if (!isToday) {
      showAppToast(ref, t.homeTomorrowToast);
      return;
    }

    final controller = ref.read(sessionLogControllerProvider.notifier);
    if (!controller.hasPendingToday) {
      showAppToast(ref, t.homeAlreadyLoggedToast);
      return;
    }

    controller.completeToday();
    final streak = ref
        .read(sessionLogControllerProvider)
        .streakAsOf(ref.read(nowProvider));
    showAppToast(ref, t.homeStreakToast(streak));
  }

  Widget _card(int index, Widget child) => ScreenEnter(
    delay: AppMotion.cardStagger * index,
    duration: AppMotion.cardRise,
    offset: 12,
    axis: Axis.vertical,
    child: child,
  );
}

class _Greeting extends StatelessWidget {
  const _Greeting({
    required this.date,
    required this.title,
    required this.onProfile,
  });

  final String date;
  final String title;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 4),
              Text(title, style: AppText.title),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Semantics(
          button: true,
          child: InkWell(
            onTap: onProfile,
            customBorder: const CircleBorder(),
            child: Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF37373B), Color(0xFF202024)],
                ),
                border: Border.all(color: AppColors.line),
              ),
              child: const Text(
                'M',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHead extends StatelessWidget {
  const _SectionHead({required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 20 * -0.025,
            color: AppColors.text,
          ),
        ),
        if (actionLabel case final label?)
          GestureDetector(
            onTap: onAction,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cyan,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

enum _HeroState { today, tomorrow, rest, allDone }

/// The one thing to do next, or an explicit rest day. Never empty — a blank
/// hero would read as a broken plan rather than a scheduled recovery.
class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.t,
    required this.session,
    required this.state,
    required this.onStart,
  });

  final AppLocalizations t;
  final PlanSession? session;
  final _HeroState state;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final resting = state == _HeroState.rest || state == _HeroState.allDone;

    final eyebrow = switch (state) {
      _HeroState.today => t.homeNextEyebrowToday,
      _HeroState.tomorrow => t.homeNextEyebrowTomorrow,
      _HeroState.rest || _HeroState.allDone => t.homeNextEyebrowRest,
    };

    final title = resting
        ? t.homeRestTitle
        : session?.name.resolve(t) ?? t.homeRestTitle;

    return Container(
      constraints: const BoxConstraints(minHeight: 222),
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF242426), Color(0xFF19191B)],
          stops: [0, 0.72],
        ),
        borderRadius: BorderRadius.circular(AppRadii.cardLg),
        border: Border.all(color: AppColors.line),
      ),
      child: Stack(
        children: [
          const Positioned(right: -70, top: -74, child: _HeroOrbit()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eyebrow.toUpperCase(),
                          style: AppText.eyebrow.copyWith(
                            fontSize: 12,
                            letterSpacing: 12 * 0.04,
                            color: AppColors.lime,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 26,
                            height: 1.08,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 26 * -0.04,
                            leadingDistribution: TextLeadingDistribution.even,
                            color: AppColors.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if (resting)
                Text(t.homeRestBody, style: AppText.bodySm)
              else
                Wrap(
                  spacing: 14,
                  runSpacing: 6,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.cyan,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${session?.duration ?? '45'} ${t.unitMinutes}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                    if (session case final session?)
                      Text(
                        t.planSessionExercises(session.exercises.length),
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    Text(
                      t.homeSessionRpe,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: resting ? null : onStart,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.lime,
                    foregroundColor: AppColors.bg,
                    disabledBackgroundColor: const Color(0xFF303033),
                    disabledForegroundColor: AppColors.muted,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadii.button),
                    ),
                  ),
                  child: Text(
                    switch (state) {
                      _HeroState.today => t.homeStartCta,
                      _HeroState.tomorrow => t.homeViewCta,
                      _HeroState.rest || _HeroState.allDone =>
                        t.homeCompletedCta,
                    },
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The concentric rings bleeding off the hero's top-right corner.
class _HeroOrbit extends StatelessWidget {
  const _HeroOrbit();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.lime.withValues(alpha: 0.11),
            width: 18,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.cyan.withValues(alpha: 0.08),
                width: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Last completed session, or a neutral empty state before the first one.
class _RecentRow extends StatelessWidget {
  const _RecentRow({
    required this.t,
    required this.log,
    required this.session,
    required this.onTap,
  });

  final AppLocalizations t;
  final SessionLog log;
  final PlanSession? session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final last = log.days.where((d) => d.completed).lastOrNull;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadii.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.card),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadii.card),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cyan.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.fitness_center_rounded,
                  size: 20,
                  color: AppColors.cyan,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      last == null
                          ? t.homeRecentEmpty
                          : session?.name.resolve(t) ?? t.homeRecentTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (last != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        t.homeRecentMeta(100, 6),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.muted2,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
