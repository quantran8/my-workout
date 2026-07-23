import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../data/auth_controller.dart';
import '../../models/auth_session.dart';
import '../auth_messages.dart';
import '../widgets/auth_field.dart';

/// Email + password sign-up.
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _obscured = true;
  bool _submitting = false;

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting) return;

    final t = AppLocalizations.of(context);
    final email = _email.text.trim();
    final password = _password.text;

    if (!isValidEmail(email)) {
      showAppToast(ref, t.authErrorInvalidEmail);
      return;
    }
    if (password.length < kMinPasswordLength) {
      showAppToast(ref, t.authErrorPasswordTooShort);
      return;
    }
    if (password != _confirm.text) {
      showAppToast(ref, t.authErrorPasswordMismatch);
      return;
    }

    setState(() => _submitting = true);
    try {
      final result = await ref
          .read(authProvider.notifier)
          .register(
            email: email,
            password: password,
            fullName: _fullName.text.trim(),
          );
      if (!mounted) return;

      switch (result) {
        // Signed in already — go straight into onboarding.
        case RegisteredWithSession():
          showAppToast(ref, t.authRegisterSuccess);
          context.go(Routes.welcome);
        // The project requires email confirmation, so send them to sign in
        // once they have clicked the link.
        case RegisteredNeedsConfirm():
          showAppToast(ref, t.authNeedsEmailConfirm);
          context.go(Routes.login);
      }
    } catch (error) {
      if (!mounted) return;
      showAppToast(ref, authErrorMessage(t, error));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ScreenScaffold(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      body: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(t.authRegisterEyebrow.toUpperCase(), style: AppText.eyebrow),
            const SizedBox(height: 10),
            Text(t.authRegisterHeadline, style: AppText.title),
            const SizedBox(height: 13),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 355),
              child: Text(t.authRegisterBody, style: AppText.subtitle),
            ),
            const SizedBox(height: 32),

            AuthField(
              label: t.authFullNameLabel,
              controller: _fullName,
              hint: t.authFullNameHint,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 18),

            AuthField(
              label: t.authEmailLabel,
              controller: _email,
              hint: t.authEmailHint,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
            ),
            const SizedBox(height: 18),

            AuthField(
              label: t.authPasswordLabel,
              controller: _password,
              hint: t.authPasswordHint,
              obscure: _obscured,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newPassword],
              trailing: PasswordToggle(
                obscured: _obscured,
                semanticLabel: _obscured
                    ? t.authShowPassword
                    : t.authHidePassword,
                onTap: () => setState(() => _obscured = !_obscured),
              ),
            ),
            const SizedBox(height: 18),

            AuthField(
              label: t.authConfirmPasswordLabel,
              controller: _confirm,
              hint: t.authConfirmPasswordHint,
              obscure: _obscured,
              textInputAction: TextInputAction.go,
              autofillHints: const [AutofillHints.newPassword],
              onSubmitted: (_) => _submit(),
              trailing: PasswordToggle(
                obscured: _obscured,
                semanticLabel: _obscured
                    ? t.authShowPassword
                    : t.authHidePassword,
                onTap: () => setState(() => _obscured = !_obscured),
              ),
            ),
            const SizedBox(height: 28),

            PrimaryButton(
              label: t.authRegisterCta,
              onPressed: _submitting ? null : _submit,
            ),
            const SizedBox(height: 16),

            Center(
              child: GestureDetector(
                onTap: _submitting ? null : () => context.go(Routes.login),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    t.authToLogin,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lime,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
