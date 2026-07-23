import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/auth_controller.dart';

/// Bottom sheet showing who is signed in, with the sign-out action.
///
/// The router redirects to login on its own once the session clears, so this
/// only has to pop itself.
class AccountSheet extends ConsumerWidget {
  const AccountSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => const AccountSheet(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final user = ref.watch(authProvider).value?.user;

    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        20 + MediaQuery.viewPaddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user?.displayName case final name? when name.isNotEmpty) ...[
            Text(name, style: AppText.title),
            const SizedBox(height: 4),
          ],
          Text(user?.email ?? '', style: AppText.subtitle),
          const SizedBox(height: 24),
          PrimaryButton(
            label: t.authLogoutCta,
            variant: PrimaryButtonVariant.surface,
            onPressed: () async {
              final navigator = Navigator.of(context);
              await ref.read(authProvider.notifier).logout();
              navigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
