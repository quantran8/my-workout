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
import '../auth_messages.dart';
import '../widgets/auth_field.dart';

/// Email + password sign-in.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscured = true;
  bool _submitting = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
    if (password.isEmpty) {
      showAppToast(ref, t.authErrorPasswordTooShort);
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref
          .read(authProvider.notifier)
          .login(email: email, password: password);
      if (!mounted) return;
      context.go(Routes.home);
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
            Text(t.authLoginEyebrow.toUpperCase(), style: AppText.eyebrow),
            const SizedBox(height: 10),
            Text(t.authLoginHeadline, style: AppText.title),
            const SizedBox(height: 13),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 355),
              child: Text(t.authLoginBody, style: AppText.subtitle),
            ),
            const SizedBox(height: 32),

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
              textInputAction: TextInputAction.go,
              autofillHints: const [AutofillHints.password],
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
              label: t.authLoginCta,
              onPressed: _submitting ? null : _submit,
            ),
            const SizedBox(height: 16),

            Center(
              child: GestureDetector(
                onTap: _submitting ? null : () => context.go(Routes.register),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    t.authToRegister,
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
