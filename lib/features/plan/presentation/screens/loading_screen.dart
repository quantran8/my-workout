import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/loader_ring.dart';

import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/stage_check_row.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../data/plan_providers.dart';

/// Screen 9 — the pipeline made visible while the plan is generated.
///
/// Stages advance on a timer that is deliberately faster than the repository's
/// delay, so the last stage lands just before the plan resolves. Navigation is
/// driven by the provider, not the timer — a slow backend simply holds on the
/// final stage rather than advancing to an empty screen.
class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  static const _stageInterval = Duration(milliseconds: 620);

  Timer? _timer;
  int _stage = 0;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_stageInterval, (timer) {
      if (!mounted) return;
      if (_stage >= 4) {
        timer.cancel();
        return;
      }
      setState(() => _stage++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    ref.listen(planProvider, (previous, next) {
      if (_navigated || !next.hasValue) return;
      _navigated = true;
      // Capture the router now — `context` must not be touched after the gap.
      final router = GoRouter.of(context);
      Future.delayed(const Duration(milliseconds: 260), () {
        // Let the final stage register before moving on.
        if (mounted) router.go(Routes.plan);
      });
    });

    final titles = [
      t.loadingTitle1,
      t.loadingTitle2,
      t.loadingTitle3,
      t.loadingTitle4,
    ];
    final stages = [
      t.loadingStage1,
      t.loadingStage2,
      t.loadingStage3,
      t.loadingStage4,
    ];

    return ScreenScaffold(
      centred: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: LoaderRing()),
          const SizedBox(height: 28),

          Text(
            t.loadingEyebrow,
            textAlign: TextAlign.center,
            style: AppText.loadingTitle,
          ),
          const SizedBox(height: 9),

          // The copy rotates with the pipeline stage below.
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              key: ValueKey(_stage),
              width: double.infinity,
              child: Text(
                titles[_stage.clamp(0, titles.length - 1)],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.muted,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),

          const Center(child: LoadingDots()),
          const SizedBox(height: 32),

          for (final (index, label) in stages.indexed) ...[
            if (index > 0) const SizedBox(height: 8),
            StageCheckRow(
              index: index + 1,
              label: label,
              done: _stage > index,
            ),
          ],
        ],
      ),
    );
  }
}
