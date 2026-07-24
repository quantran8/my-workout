import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../data/practice_mapper.dart';
import '../../data/session_launch.dart';
import '../controller/practice_controller.dart';
import 'readiness_screen.dart';

/// Hosts [ReadinessScreen] and owns the session lifecycle it triggers.
///
/// [ReadinessScreen] stays pure (it only collects answers); this widget turns a
/// submit/skip into `beginSession` → readiness verdict → `loadExecution`, then
/// navigates to the practice runner. A `hold` verdict does **not** stop the flow
/// (`SESSION-2`): the execution snapshot already has the modifications applied,
/// and the runner surfaces the reasons. If there is no armed session (opened
/// directly), it bounces home.
class ReadinessRoute extends ConsumerStatefulWidget {
  const ReadinessRoute({super.key});

  @override
  ConsumerState<ReadinessRoute> createState() => _ReadinessRouteState();
}

class _ReadinessRouteState extends ConsumerState<ReadinessRoute> {
  bool _busy = false;

  Future<void> _begin(ReadinessAnswers answers) async {
    if (_busy) return;
    final launch = ref.read(pendingSessionProvider);
    final t = AppLocalizations.of(context);
    final router = GoRouter.of(context);
    if (launch == null) {
      router.go(Routes.home);
      return;
    }

    setState(() => _busy = true);
    final notifier = ref.read(practiceProvider.notifier);
    try {
      await notifier.beginSession(
        programRevisionId: launch.programRevisionId,
        plannedSessionId: launch.plannedSessionId,
        readiness: answers,
      );
      // Build the immutable snapshot (already reflects any readiness
      // modifications), then hand off to the runner.
      await notifier.loadExecution();
      ref.read(pendingSessionProvider.notifier).clear();
      if (mounted) router.go(Routes.practice);
    } catch (_) {
      if (!mounted) return;
      setState(() => _busy = false);
      showAppToast(ref, t.practiceSessionStartError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ReadinessScreen(
          onSubmit: _begin,
          onSkip: () => _begin(const ReadinessAnswers.skipped()),
        ),
        if (_busy)
          const Positioned.fill(
            child: ColoredBox(
              color: Color(0x99000000),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
