import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/noise_background.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_enter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../../auth/data/auth_controller.dart';
import '../../../auth/models/auth_session.dart';
import '../../../home/presentation/widgets/home_bottom_nav.dart';

/// The Profile tab — who is signed in, plus the sign-out action.
///
/// Sign-out delegates to [Auth.logout] (AUTH-6): storage is cleared and the
/// session set to null regardless of the server call, and the router redirects
/// to `/login` on its own once the session clears (AUTH-5). This screen never
/// navigates away by hand.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final user = ref.watch(authProvider).value?.user;

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
                      HomeBottomNav.height +
                          MediaQuery.viewPaddingOf(context).bottom +
                          24,
                    ),
                    children: [
                      _Header(t: t, user: user),
                      const SizedBox(height: 28),

                      _SectionHead(title: t.profileAccountSection),
                      const SizedBox(height: 12),
                      _InfoCard(
                        rows: [
                          (t.profileNameLabel,
                              _displayName(user) ?? t.profileNamePlaceholder),
                          (t.profileEmailLabel, user?.email ?? '—'),
                          (t.profileProviderLabel, user?.provider ?? '—'),
                        ],
                      ),

                      const SizedBox(height: 28),
                      _SectionHead(title: t.profileSignOutSection),
                      const SizedBox(height: 12),
                      Text(t.profileSignOutHint, style: AppText.bodySm),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        label: t.authLogoutCta,
                        variant: PrimaryButtonVariant.surface,
                        onPressed: () =>
                            ref.read(authProvider.notifier).logout(),
                      ),
                    ],
                  ),
                ),
              ),
              HomeBottomNav(
                currentIndex: 3,
                items: [
                  HomeNavItem(
                    icon: Icons.home_rounded,
                    label: t.homeNavHome,
                    onTap: () => context.go(Routes.home),
                  ),
                  HomeNavItem(
                    icon: Icons.article_outlined,
                    label: t.homeNavPlan,
                    onTap: () => context.go(Routes.plan),
                  ),
                  HomeNavItem(
                    icon: Icons.schedule_rounded,
                    label: t.homeNavLog,
                    onTap: () => context.go(Routes.home),
                  ),
                  HomeNavItem(
                    icon: Icons.person_rounded,
                    label: t.homeNavProfile,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String? _displayName(AuthUser? user) {
    for (final candidate in [user?.displayName, user?.fullName]) {
      if (candidate case final name? when name.isNotEmpty) return name;
    }
    return null;
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.t, required this.user});

  final AppLocalizations t;
  final AuthUser? user;

  @override
  Widget build(BuildContext context) {
    final name = ProfileScreen._displayName(user);
    final initial = (name ?? user?.email ?? '?').characters.first.toUpperCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.profileEyebrow.toUpperCase(),
          style: AppText.eyebrow,
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
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
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? t.profileTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.title.copyWith(fontSize: 24),
                  ),
                  if (user?.email case final email? when email.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.subtitle,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionHead extends StatelessWidget {
  const _SectionHead({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 20 * -0.025,
          color: AppColors.text,
        ),
      );
}

/// A surface card of label/value rows, hairline-separated.
class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.rows});

  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          for (final (index, (label, value)) in rows.indexed) ...[
            if (index > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.line),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              child: Row(
                children: [
                  Text(label, style: AppText.summaryLabel),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      value,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.summaryValue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
