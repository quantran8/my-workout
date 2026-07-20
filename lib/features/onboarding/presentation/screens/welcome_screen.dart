import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/loader_ring.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';

/// Screen 2 — welcome. Sets the "narrative before forms" expectation before any
/// structured input appears.
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return ScreenScaffold(
      header: ScreenHeader(
        leading: CircleBackButton(onTap: () => context.go(Routes.account)),
      ),
      footer: PrimaryButton(
        label: t.welcomeCta,
        onPressed: () => context.go(Routes.story),
      ),
      // The body is centred in the viewport, per `.screen[data-step="1"]`.
      centred: true,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 110),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // `.welcome-art` — 250px tall, rings centred.
          const SizedBox(
            height: 250,
            child: Center(child: ActivityRings()),
          ),
          const SizedBox(height: 14),

          Text(t.welcomeEyebrow.toUpperCase(), style: AppText.eyebrow),
          const SizedBox(height: 10),
          Text(t.welcomeHeadline, style: AppText.title),
          const SizedBox(height: 13),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 355),
            child: Text(t.welcomeBody, style: AppText.subtitle),
          ),
        ],
      ),
    );
  }
}
