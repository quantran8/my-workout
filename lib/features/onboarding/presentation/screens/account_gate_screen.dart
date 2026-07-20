import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/locale_controller.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../controller/onboarding_controller.dart';

/// Screen 1 — account gate. Collected before any onboarding data so the profile
/// and history have somewhere to live.
class AccountGateScreen extends ConsumerStatefulWidget {
  const AccountGateScreen({super.key});

  @override
  ConsumerState<AccountGateScreen> createState() => _AccountGateScreenState();
}

class _AccountGateScreenState extends ConsumerState<AccountGateScreen> {
  final _email = TextEditingController(text: 'a@gmail.com');

  @override
  void initState() {
    super.initState();
    _email.text = ref.read(onboardingProvider).account.email;
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _continue() {
    final email = _email.text.trim();
    if (!_isValidEmail(email)) {
      showAppToast(ref, AppLocalizations.of(context).accountInvalidEmail);
      return;
    }
    ref.read(onboardingProvider.notifier).setEmail(email);
    context.go(Routes.welcome);
  }

  static bool _isValidEmail(String value) => RegExp(r'^[^@\s]+@[^@\s.]+\.[^@\s]+$').hasMatch(value);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ScreenScaffold(
      // `.account-screen` has no app header and its own padding.
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _AppMark(),
              const SizedBox(width: 9),
              // Flexible: the app name plus the locale toggle overflows a
              // 390px viewport otherwise.
              Flexible(
                child: Text(
                  t.appName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 12),
              const _LocaleToggle(),
            ],
          ),

          // `.account-main{flex:1;justify-content:center}` — the block below
          // the brand row is vertically centred in the remaining space.
          const SizedBox(height: 48),

          Container(
            width: 92,
            height: 92,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.lime.withValues(alpha: 0.18), AppColors.cyan.withValues(alpha: 0.06)],
              ),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
              boxShadow: [AppShadows.glow],
            ),
            child: const _PulseGlyph(),
          ),
          const SizedBox(height: 28),

          Text(t.accountEyebrow.toUpperCase(), style: AppText.eyebrow),
          const SizedBox(height: 10),
          Text(t.accountHeadline, style: AppText.title),
          const SizedBox(height: 13),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 355),
            child: Text(t.accountBody, style: AppText.subtitle),
          ),
          const SizedBox(height: 28),

          PrimaryButton(label: t.accountAppleCta, variant: PrimaryButtonVariant.white, onPressed: _continue),

          // `.email-wrap` — a 5px-padded surface holding the field and CTA.
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.fieldWrap),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: AppTextField(
                    controller: _email,
                    hint: t.accountEmailHint,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.go,
                    bare: true,
                    onSubmitted: (_) => _continue(),
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: PrimaryButton(label: t.accountEmailCta, onPressed: _continue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          Center(
            child: Text(t.accountDisclaimer, textAlign: TextAlign.center, style: AppText.fine),
          ),
        ],
      ),
    );
  }
}

/// `.brand-dot` — a 31px lime tile carrying the app initial.
class _AppMark extends StatelessWidget {
  const _AppMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31,
      height: 31,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColors.lime, borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.bolt_rounded, size: 19, color: Colors.black),
    );
  }
}

/// The hero mark's pulse-line glyph, matching the prototype's inline SVG.
class _PulseGlyph extends StatelessWidget {
  const _PulseGlyph();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(44, 44), painter: _PulsePainter());
  }
}

class _PulsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Path from the SVG: M7 22h7l3.4-10 7.3 21 4.5-11H37
    final s = size.width / 44;
    final path = Path()
      ..moveTo(7 * s, 22 * s)
      ..lineTo(14 * s, 22 * s)
      ..lineTo(17.4 * s, 12 * s)
      ..lineTo(24.7 * s, 33 * s)
      ..lineTo(29.2 * s, 22 * s)
      ..lineTo(37 * s, 22 * s);

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * s
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = AppColors.lime,
    );
  }

  @override
  bool shouldRepaint(_PulsePainter oldDelegate) => false;
}

class _LocaleToggle extends ConsumerWidget {
  const _LocaleToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return SizedBox(
      width: 96,
      child: SegmentedControl<String>(
        value: Localizations.localeOf(context).languageCode,
        onChanged: (code) => ref.read(localeControllerProvider.notifier).set(Locale(code)),
        options: [
          SelectOption(value: 'vi', label: t.localeVietnamese),
          SelectOption(value: 'en', label: t.localeEnglish),
        ],
      ),
    );
  }
}
