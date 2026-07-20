import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/tokens.dart';
import '../theme/typography.dart';

/// Single-line field with the acid focus ring.
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.bare = false,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;

  /// Drops the fill and border, for a field nested inside a surface that
  /// already provides them (the account screen's `.email-wrap`).
  final bool bare;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: AppText.input,
      decoration: bare
          ? InputDecoration(
              hintText: hint,
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            )
          : InputDecoration(hintText: hint),
    );
  }
}

/// Multi-line field, optionally with a character counter.
class AppTextArea extends StatefulWidget {
  const AppTextArea({
    required this.controller,
    this.hint,
    this.minLines = 5,
    this.maxLines = 10,
    this.showCounter = false,
    this.counterBuilder,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final int minLines;
  final int maxLines;
  final bool showCounter;

  /// Builds the counter label, e.g. `(n) => '$n ký tự'`. Required when
  /// [showCounter] is set — the string is localized, so it can't live here.
  final String Function(int length)? counterBuilder;
  final ValueChanged<String>? onChanged;

  @override
  State<AppTextArea> createState() => _AppTextAreaState();
}

class _AppTextAreaState extends State<AppTextArea> {
  @override
  void initState() {
    super.initState();
    if (widget.showCounter) {
      widget.controller.addListener(_onTextChanged);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: widget.controller,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.multiline,
          textCapitalization: TextCapitalization.sentences,
          style: AppText.input,
          decoration: InputDecoration(hintText: widget.hint),
        ),
        if (widget.showCounter && widget.counterBuilder != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.counterBuilder!(widget.controller.text.characters.length),
            style: AppText.hint,
          ),
        ],
      ],
    );
  }
}

/// Number field with a trailing unit label (cm / kg / phút).
class UnitInput extends StatelessWidget {
  const UnitInput({
    required this.controller,
    required this.unit,
    this.onChanged,
    this.decimal = false,
    super.key,
  });

  final TextEditingController controller;
  final String unit;
  final ValueChanged<String>? onChanged;
  final bool decimal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.numberWithOptions(decimal: decimal),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              decimal ? RegExp(r'[0-9.,]') : RegExp(r'[0-9]'),
            ),
          ],
          style: AppText.input,
          decoration: const InputDecoration(
            // Room for the unit label.
            contentPadding: EdgeInsets.fromLTRB(16, 15, 48, 15),
          ),
        ),
        Positioned(
          right: 16,
          child: Text(
            unit,
            style: const TextStyle(fontSize: 13, color: AppColors.muted),
          ),
        ),
      ],
    );
  }
}
