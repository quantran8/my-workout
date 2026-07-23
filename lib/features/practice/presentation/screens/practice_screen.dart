import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/screen_enter.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../../home/data/session_log_controller.dart';
import '../../data/practice_mapper.dart';
import '../controller/practice_controller.dart';
import '../widgets/cardio_info_sheet.dart';
import '../widgets/pain_detail_sheet.dart';
import '../widgets/cardio_overview_view.dart';
import '../widgets/cardio_practice_view.dart';
import '../widgets/cardio_structured_view.dart';
import '../widgets/finish_sheet.dart';
import '../widgets/practice_feedback_sheet.dart';
import '../widgets/set_overview_view.dart';
import '../widgets/set_practice_view.dart';

/// The active-session screen: a thin shell over the practice stage machine.
/// Each stage supplies its own header, body and footer; this shell lays them
/// out and drives the shared guide / feedback / finish sheets.
///
/// Neither header carries a mode switch, so the route decides the mode:
/// [initialMode] is applied once on entry.
class PracticeScreen extends ConsumerStatefulWidget {
  const PracticeScreen({this.initialMode = PracticeMode.set, super.key});

  final PracticeMode initialMode;

  @override
  ConsumerState<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends ConsumerState<PracticeScreen> {
  @override
  void initState() {
    super.initState();
    // Land on the launch mode's overview after the provider is built.
    Future.microtask(
      () => ref.read(practiceProvider.notifier).enterMode(widget.initialMode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final stage = ref.watch(practiceProvider.select((s) => s.stage));

    void toHome() => context.go(Routes.home);
    final notifier = ref.read(practiceProvider.notifier);

    final (header, body, footer, scrimFooter) = switch (stage) {
      PracticeStage.setOverview => (
        SetOverviewView.header(ref: ref, context: context, onBack: toHome),
        const SetOverviewView(),
        SetOverviewView.footer(ref: ref, context: context),
        true,
      ),
      PracticeStage.setActive || PracticeStage.setRest => (
        SetPracticeView.header(
          ref: ref,
          context: context,
          onBack: notifier.showSetOverview,
          onFeedback: () => _openFeedback(context, ref, t),
        ),
        const SetPracticeView(),
        SetPracticeView.footer(ref: ref, context: context),
        true,
      ),
      PracticeStage.cardioOverview => (
        CardioOverviewView.header(ref: ref, context: context, onBack: toHome),
        const CardioOverviewView(),
        CardioOverviewView.footer(ref: ref, context: context),
        true,
      ),
      PracticeStage.cardioContinuous => (
        CardioPracticeView.header(
          ref: ref,
          context: context,
          onBack: notifier.showCardioOverview,
        ),
        const CardioPracticeView(),
        CardioPracticeView.footer(
          ref: ref,
          context: context,
          onLap: () => showAppToast(ref, t.practiceCardioLapToast),
          onPause: _onCardioPause,
          onFinish: () => _openFinish(context, ref, t),
        ),
        false,
      ),
      PracticeStage.cardioStructured => (
        CardioStructuredView.header(
          ref: ref,
          context: context,
          onBack: notifier.showCardioOverview,
          onInfo: () => _openCardioInfo(context, ref, t),
        ),
        const CardioStructuredView(),
        CardioStructuredView.footer(
          ref: ref,
          context: context,
          onSkip: notifier.skipStructuredStep,
          onPause: notifier.toggleStructured,
          onFinish: () => _openFinish(context, ref, t),
        ),
        false,
      ),
    };

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            header,
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    // Keyed so the entrance replays when the stage changes.
                    child: ScreenEnter(key: ValueKey(stage), child: body),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // The set/overview footers float over content behind a
                    // scrim; the cardio runners bring their own raised panels.
                    child: scrimFooter ? _FooterScrim(child: footer) : footer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCardioPause() {
    final t = AppLocalizations.of(context);
    ref.read(practiceProvider.notifier).toggleCardio();
    showAppToast(
      ref,
      ref.read(practiceProvider).cardioRunning
          ? t.practiceResumedToast
          : t.practicePausedToast,
    );
  }

  Future<void> _openCardioInfo(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations t,
  ) => showCardioInfoSheet(context, ref.read(practiceProvider), t);

  Future<void> _openFeedback(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations t,
  ) async {
    final result = await showPracticeFeedbackSheet(context, t);
    if (result == null) return;
    final notifier = ref.read(practiceProvider.notifier);

    if (result == PracticeFeedback.pain) {
      // Halt first — the session must stop whether or not the user goes on to
      // describe the pain.
      notifier.painStop();

      final detail = context.mounted
          ? await showPainDetailSheet(context)
          : null;
      unawaited(
        notifier
            .sendFeedback(
              PracticeMapper.feedbackType(result),
              bodyArea: detail == null
                  ? null
                  : PracticeMapper.bodyArea(detail.area),
              severity: detail?.severity,
            )
            .catchError((_) {}),
      );
      showAppToast(ref, t.practicePainToast);
    } else {
      unawaited(
        notifier
            .sendFeedback(PracticeMapper.feedbackType(result))
            .catchError((_) {}),
      );
      showAppToast(ref, t.practiceFeedbackSaved(result.label(t)));
    }
  }

  Future<void> _openFinish(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations t,
  ) async {
    final notifier = ref.read(practiceProvider.notifier);
    notifier.pauseForFinish();
    final result = await showFinishSheet(context, t);
    if (result.saved) {
      // Carries the 1-10 effort rating, which the sheet previously discarded.
      unawaited(
        notifier
            .completeSession(sessionRpe: result.sessionRpe)
            .catchError((_) {}),
      );
      // Log the day so home's streak and adherence advance.
      final log = ref.read(sessionLogControllerProvider.notifier);
      if (log.hasPendingToday) log.completeToday();
      showAppToast(ref, t.practiceWorkoutSavedToast);
      if (context.mounted) context.go(Routes.home);
    } else {
      notifier.resumeAfterFinish();
    }
  }
}

/// `.footer` — the scrim gradient that lets content scroll under the CTA row.
class _FooterScrim extends StatelessWidget {
  const _FooterScrim({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 32, 20, inset > 16 ? inset : 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x00000000), Color(0xEB000000), Color(0xFF000000)],
          stops: [0, 0.26, 0.56],
        ),
      ),
      child: child,
    );
  }
}
