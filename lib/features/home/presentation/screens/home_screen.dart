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
import '../../../practice/data/session_launch.dart';
import '../../data/access_controller.dart';
import '../../data/current_providers.dart';
import '../../data/dashboard_providers.dart';
import '../../data/session_log_controller.dart';
import '../../models/current.dart';
import '../../models/dashboard.dart';
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
    // Null while the dashboard request is in flight (or signed out) — Home falls
    // back to the local session log so it renders immediately rather than
    // blocking. Once resolved, the backend's computed metrics take over.
    final dashboard = ref.watch(dashboardProvider).value;
    // The current actionable session (`GET /program/current`): today's session
    // when it is a training day, plus the next unlogged one so a rest day is
    // still startable. Null while in flight / signed out — the hero falls back.
    final current = ref.watch(currentProvider).value;
    final SessionLog log = dashboard?.sessionLog ?? ref.watch(sessionLogControllerProvider);
    final access = dashboard?.accessTier ?? ref.watch(accessProvider);
    // Null while the plan is still generating — every consumer below already
    // falls back, so home renders rather than blocking on it.
    final plan = ref.watch(planProvider).value;

    final locale = Localizations.localeOf(context).toLanguageTag();
    final today = DateTime(now.year, now.month, now.day);

    // Headline metrics come off the server-computed dashboard when present; the
    // local SessionLog derivations are the offline/first-frame fallback.
    final dueCount = dashboard?.due ?? log.dueAsOf(now).length;
    final done = dashboard?.done ?? log.completedAsOf(now);
    final streak = dashboard?.streak ?? log.streakAsOf(now);
    final adherence = dashboard?.adherence ?? log.adherenceAsOf(now);
    final report = ProgressReport.from(log.baselineSessions);

    // The hero card's state + the session it offers to start. Source priority:
    //  1. `current` (GET /program/current) — authoritative. Its `status` says
    //     whether today is a training day; `actionable` is today's session when
    //     training, else the next unlogged one so a rest day is still startable
    //     (user-centric: the CTA never dead-ends). `program_complete`/`no_program`
    //     with no actionable session → allDone.
    //  2. `dashboard.nextSession` — if `current` is still resolving but the
    //     dashboard is in, use its next planned day (equivalent to actionable).
    //  3. local seed — offline/first-frame day-by-day derivation.
    // NOTE: `sessionLog.days` holds only *completed* days, so deriving "next"
    // from it made a fresh program (no logs yet) read as "recovery day" — the bug
    // this replaces.
    final _HeroState heroState;
    final SessionSummary? heroSession;
    if (current != null) {
      heroSession = current.actionable == null
          ? null
          : SessionSummary(
              plannedSessionId: current.actionable!.plannedSessionId,
              programRevisionId: current.actionable!.programRevisionId,
              name: current.actionable!.name,
              exercises: current.actionable!.exercises,
            );
      heroState = switch (current.status) {
        CurrentStatus.training => _HeroState.today,
        // Rest / before-start / unknown but a next session exists → offer it.
        CurrentStatus.rest ||
        CurrentStatus.beforeStart ||
        CurrentStatus.unknown => heroSession != null ? _HeroState.restStartable : _HeroState.allDone,
        CurrentStatus.programComplete || CurrentStatus.noProgram => _HeroState.allDone,
      };
    } else if (dashboard?.nextSession case final next?) {
      heroSession = SessionSummary(
        plannedSessionId: next.plannedSessionId,
        programRevisionId: next.programRevisionId,
        name: next.name,
        exercises: next.exercises,
      );
      heroState = _HeroState.today;
    } else if (dashboard != null) {
      // Dashboard in, no next session → everything logged.
      heroSession = null;
      heroState = _HeroState.allDone;
    } else {
      // Offline / first frame: fall back to the local seed's day derivation.
      final seedNext = log.days.where((d) => !d.completed).firstOrNull?.day;
      heroState = seedNext == null
          ? _HeroState.allDone
          : seedNext == today
          ? _HeroState.today
          : seedNext == today.add(const Duration(days: 1))
          ? _HeroState.tomorrow
          : _HeroState.rest;
      // A seed "today" is startable but has no server ids — an empty-revision
      // summary makes _start route to the standalone runner (Routes.practice).
      heroSession = heroState == _HeroState.today
          ? const SessionSummary(plannedSessionId: '', programRevisionId: '', name: '', exercises: 0)
          : null;
    }
    // The CTA is actionable whenever there is a session to start.
    final canStart = heroSession != null && (heroState == _HeroState.today || heroState == _HeroState.restStartable);

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
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.screenH,
                      8,
                      AppSpacing.screenH,
                      HomeBottomNav.height + MediaQuery.viewPaddingOf(context).bottom + 24,
                    ),
                    children: [
                      _Greeting(
                        date: DateFormat.yMMMMEEEEd(locale).format(now),
                        title: t.homeGreeting,
                        onProfile: () => context.go(Routes.profile),
                      ),
                      const SizedBox(height: 24),

                      _card(
                        0,
                        _HeroCard(
                          t: t,
                          session: session,
                          heroSession: heroSession,
                          state: heroState,
                          onStart: canStart ? () => _start(context, ref, heroSession!) : null,
                        ),
                      ),

                      const SizedBox(height: 26),
                      _SectionHead(
                        title: t.homeWeekTitle,
                        actionLabel: t.homeWeekPlanLink,
                        onAction: () => context.go(Routes.plan),
                      ),
                      // Whole-program "X of M sessions" from the server; hidden when
                      // there is no active program yet (total 0).
                      if (dashboard?.programProgress case final p? when p.total > 0) ...[
                        const SizedBox(height: 8),
                        _ProgramProgressBar(
                          completed: p.completed,
                          total: p.total,
                          label: t.homeWeekSessions(p.completed, p.total),
                        ),
                      ],
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
                                value: '${(adherence * 100).round()}',
                                unit: '%',
                                caption: t.homeAdherenceFoot(done, dueCount),
                                figure: AdherenceRing(value: adherence),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 26),
                      _SectionHead(
                        title: t.homeProgressTitle,
                        actionLabel: access == AccessTier.paid ? t.homeProgressProLink : t.homeProgressUpsellLink,
                        onAction: () => ref.read(accessProvider.notifier).toggle(),
                      ),
                      const SizedBox(height: 12),
                      _card(
                        3,
                        access == AccessTier.paid
                            ? UnlockedProgressCard(report: report, t: t)
                            : LockedProgressCard(
                                report: report,
                                t: t,
                                onUnlock: () => showAppToast(ref, t.homeUnlockToast),
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
                          recent: dashboard?.recent,
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
                  HomeNavItem(icon: Icons.home_rounded, label: t.homeNavHome, onTap: () {}),
                  HomeNavItem(icon: Icons.article_outlined, label: t.homeNavPlan, onTap: () => context.go(Routes.plan)),
                  HomeNavItem(
                    icon: Icons.schedule_rounded,
                    label: t.homeNavLog,
                    onTap: () => showAppToast(ref, t.homeNavToast),
                  ),
                  HomeNavItem(
                    icon: Icons.person_outline_rounded,
                    label: t.homeNavProfile,
                    onTap: () => context.go(Routes.profile),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Start the session the hero is showing. The caller only wires this up when
  /// there IS an actionable session (`canStart`), so [heroSession] is real: it is
  /// today's session on a training day, or the next unlogged one on a rest day
  /// (the user chose to train ahead). Without a `programRevisionId` (should not
  /// happen for a server session) fall back to the standalone runner.
  void _start(BuildContext context, WidgetRef ref, SessionSummary heroSession) {
    if (heroSession.programRevisionId.isEmpty) {
      context.go(Routes.practice);
      return;
    }
    ref
        .read(pendingSessionProvider.notifier)
        .set(
          SessionLaunch(
            programRevisionId: heroSession.programRevisionId,
            plannedSessionId: heroSession.plannedSessionId,
            name: heroSession.name,
          ),
        );
    // Readiness gate first (SESSION-1); it begins the session and hands off to
    // the runner with live data.
    context.go(Routes.readiness);
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
  const _Greeting({required this.date, required this.title, required this.onProfile});

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
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.muted),
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
              child: const Text('M', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
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
        // Both labels are localized and neither can shrink on its own, so a
        // long Vietnamese title plus its action overflows a 390px row.
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 20 * -0.025,
              color: AppColors.text,
            ),
          ),
        ),
        if (actionLabel case final label?)
          GestureDetector(
            onTap: onAction,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.cyan),
              ),
            ),
          ),
      ],
    );
  }
}

/// A thin "X of M sessions" bar for whole-program progress, under the week head.
/// Only shown when the program has a known total (see [Dashboard.programProgress]).
class _ProgramProgressBar extends StatelessWidget {
  const _ProgramProgressBar({required this.completed, required this.total, required this.label});

  final int completed;
  final int total;
  final String label;

  @override
  Widget build(BuildContext context) {
    final fraction = total <= 0 ? 0.0 : (completed / total).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.muted),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 6,
            backgroundColor: AppColors.line,
            valueColor: const AlwaysStoppedAnimation(AppColors.lime),
          ),
        ),
      ],
    );
  }
}

// today: today IS a training day, start it. restStartable: today is rest/before
// start but the next session can be trained ahead (user-centric). tomorrow/rest:
// local-seed fallback states. allDone: nothing to start (program complete / all
// logged).
enum _HeroState { today, restStartable, tomorrow, rest, allDone }

/// The one thing to do next, or an explicit rest day. Never empty — a blank
/// hero would read as a broken plan rather than a scheduled recovery.
class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.t,
    required this.session,
    required this.heroSession,
    required this.state,
    required this.onStart,
  });

  final AppLocalizations t;
  final PlanSession? session;
  // The server's actionable session (name/exercises). Authoritative for the
  // hero's label and meta when present; the plan `session` is the fallback that
  // may still be resolving. See HOME-6.
  final SessionSummary? heroSession;
  final _HeroState state;
  // Null when there is nothing to start (allDone / seed fallback with no CTA).
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    // "resting" here means a passive card with a disabled CTA. A rest day where
    // the user CAN train ahead (restStartable) is NOT passive — it shows the
    // session and an enabled Start.
    final resting = state == _HeroState.rest || state == _HeroState.allDone;

    final eyebrow = switch (state) {
      _HeroState.today => t.homeNextEyebrowToday,
      _HeroState.restStartable => t.homeNextEyebrowRestStartable,
      _HeroState.tomorrow => t.homeNextEyebrowTomorrow,
      _HeroState.rest || _HeroState.allDone => t.homeNextEyebrowRest,
    };

    // Server name wins; fall back to the plan's session name, then the rest
    // label. An empty heroSession name (the seed-fallback sentinel) is treated as
    // "no name" so it falls through to the plan session.
    final serverName = heroSession?.name;
    final title = resting
        ? t.homeRestTitle
        : (serverName != null && serverName.isNotEmpty)
        ? serverName
        : session?.name.resolve(t) ?? t.homeRestTitle;
    final durationMin = session?.duration ?? 45;
    final exerciseCount = (heroSession?.exercises ?? 0) > 0 ? heroSession!.exercises : session?.exercises.length;

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
                          decoration: const BoxDecoration(color: AppColors.cyan, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '$durationMin ${t.unitMinutes}',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.muted),
                        ),
                      ],
                    ),
                    if (exerciseCount case final count?)
                      Text(t.planSessionExercises(count), style: TextStyle(fontSize: 12, color: AppColors.muted)),
                    Text(t.homeSessionRpe, style: TextStyle(fontSize: 12, color: AppColors.muted)),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.button)),
                  ),
                  child: Text(switch (state) {
                    _HeroState.today || _HeroState.restStartable => t.homeStartCta,
                    _HeroState.tomorrow => t.homeViewCta,
                    _HeroState.rest || _HeroState.allDone => t.homeCompletedCta,
                  }, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
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
          border: Border.all(color: AppColors.lime.withValues(alpha: 0.11), width: 18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.cyan.withValues(alpha: 0.08), width: 10),
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
    required this.recent,
    required this.onTap,
  });

  final AppLocalizations t;
  final SessionLog log;
  final PlanSession? session;
  final DashboardRecentSession? recent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // The server's recent session is authoritative; the local log only signals
    // presence for the offline/first-frame fallback.
    final last = log.days.where((d) => d.completed).lastOrNull;
    final hasRecent = recent != null || last != null;

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
                child: const Icon(Icons.fitness_center_rounded, size: 20, color: AppColors.cyan),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      !hasRecent ? t.homeRecentEmpty : recent?.name ?? session?.name.resolve(t) ?? t.homeRecentTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    if (hasRecent) ...[
                      const SizedBox(height: 3),
                      Text(
                        // Server volume/exercises when present; the local
                        // fallback has no per-session figures, so it shows 0.
                        t.homeRecentMeta(recent?.volumeKg ?? 0, recent?.exercises ?? 0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: AppColors.muted),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right_rounded, color: AppColors.muted2, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
