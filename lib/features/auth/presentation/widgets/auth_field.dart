import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';

/// A labelled field for the auth forms, matching the onboarding screens'
/// label-above-input rhythm.
class AuthField extends StatelessWidget {
  const AuthField({
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.obscure = false,
    this.autofillHints,
    this.onSubmitted,
    this.trailing,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscure;
  final List<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;

  /// Slot for the password visibility toggle.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 8),
        if (trailing == null)
          _AuthInput(
            controller: controller,
            hint: hint,
            obscure: obscure,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autofillHints: autofillHints,
            onSubmitted: onSubmitted,
          )
        else
          Stack(
            alignment: Alignment.centerRight,
            children: [
              _AuthInput(
                controller: controller,
                hint: hint,
                obscure: obscure,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                autofillHints: autofillHints,
                onSubmitted: onSubmitted,
                // Room for the visibility toggle.
                trailingInset: true,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: trailing,
              ),
            ],
          ),
      ],
    );
  }
}

/// [AppTextField] supports neither `obscureText` nor `autofillHints`, and
/// widening it for one caller would touch every onboarding screen — so the auth
/// variant lives here.
class _AuthInput extends StatelessWidget {
  const _AuthInput({
    required this.controller,
    required this.obscure,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
    this.trailingInset = false,
  });

  final TextEditingController controller;
  final bool obscure;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;

  /// Reserves right-hand padding so text does not run under the toggle.
  final bool trailingInset;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      onSubmitted: onSubmitted,
      style: AppText.input,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: trailingInset
            ? const EdgeInsets.fromLTRB(16, 15, 52, 15)
            : null,
      ),
    );
  }
}

/// Eye toggle used by the password fields.
class PasswordToggle extends StatelessWidget {
  const PasswordToggle({
    required this.obscured,
    required this.onTap,
    required this.semanticLabel,
    super.key,
  });

  final bool obscured;
  final VoidCallback onTap;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            obscured
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            size: 20,
            color: AppColors.muted,
          ),
        ),
      ),
    );
  }
}
