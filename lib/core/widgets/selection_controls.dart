import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import '../theme/typography.dart';

/// One option in a [SegmentedControl], [AppDropdown] or [ChipMultiSelect].
class SelectOption<T> {
  const SelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// iOS-style segmented control: a surface track holding equal-width segments,
/// the active one filled white.
///
/// [columns] defaults to one row of all options; pass a value to wrap into a
/// grid (the space picker uses 4 across).
class SegmentedControl<T> extends StatelessWidget {
  const SegmentedControl({
    required this.options,
    required this.value,
    required this.onChanged,
    this.columns = 0,
    super.key,
  });

  final List<SelectOption<T>> options;
  final T? value;
  final ValueChanged<T> onChanged;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final perRow = columns > 0 ? columns : options.length;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.segment),
      ),
      child: Column(
        children: [
          for (var start = 0; start < options.length; start += perRow) ...[
            if (start > 0) const SizedBox(height: 4),
            Row(
              children: [
                for (var c = 0; c < perRow; c++) ...[
                  if (c > 0) const SizedBox(width: 4),
                  Expanded(
                    child: start + c < options.length
                        ? _segment(options[start + c])
                        : const SizedBox(height: 42),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _segment(SelectOption<T> option) {
    final selected = option.value == value;

    return Semantics(
      button: true,
      selected: selected,
      label: option.label,
      child: GestureDetector(
        onTap: () => onChanged(option.value),
        child: AnimatedContainer(
          duration: AppMotion.press,
          height: 42,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.segmentItem),
          ),
          child: Text(
            option.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.black : AppColors.muted,
            ),
          ),
        ),
      ),
    );
  }
}

/// Pill chip. Selected inverts to white-on-black.
class SelectChip extends StatelessWidget {
  const SelectChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppMotion.press,
          // No `alignment` here: setting one makes the container expand to the
          // incoming max width, which is what forced one chip per row.
          constraints: const BoxConstraints(minHeight: 42),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            color: selected ? Colors.white : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(
              color: selected ? Colors.white : AppColors.line,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? Colors.black : AppColors.textSoft,
            ),
          ),
        ),
      ),
    );
  }
}

/// Multi-select chip group with a mutually exclusive "none" option.
///
/// Selecting [exclusiveValue] clears everything else; selecting anything else
/// clears it; emptying the set falls back to it. Implemented once here and used
/// by both the mobility and equipment groups.
class ChipMultiSelect<T> extends StatelessWidget {
  const ChipMultiSelect({
    required this.options,
    required this.selected,
    required this.onChanged,
    this.exclusiveValue,
    super.key,
  });

  final List<SelectOption<T>> options;
  final Set<T> selected;
  final ValueChanged<Set<T>> onChanged;
  final T? exclusiveValue;

  @override
  Widget build(BuildContext context) {
    // Align.centerLeft keeps the row hugging the leading edge; without it a
    // single-chip run is centred. Each chip sizes to its own text, so short
    // labels sit several to a row and long ones wrap naturally.
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 9,
        runSpacing: 9,
        children: [
          for (final option in options)
            SelectChip(
              label: option.label,
              selected: _isSelected(option.value),
              onTap: () => _toggle(option.value),
            ),
        ],
      ),
    );
  }

  bool _isSelected(T value) {
    if (value == exclusiveValue) {
      return selected.isEmpty || selected.contains(value);
    }
    return selected.contains(value);
  }

  void _toggle(T value) {
    if (value == exclusiveValue) {
      onChanged(<T>{});
      return;
    }

    final next = Set<T>.from(selected)..remove(exclusiveValue);
    next.contains(value) ? next.remove(value) : next.add(value);
    onChanged(next);
  }
}

/// A tappable row with an icon, title and supporting line — used where a
/// dropdown would hide the differences between options (the diet picker).
class ChoiceRow extends StatelessWidget {
  const ChoiceRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    super.key,
  });

  /// An emoji or short glyph.
  final String icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: title,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppMotion.press,
          constraints: const BoxConstraints(minHeight: 62),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.lime.withValues(alpha: 0.08)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.field),
            border: Border.all(
              color: selected
                  ? AppColors.lime.withValues(alpha: 0.6)
                  : AppColors.line,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(AppRadii.icon),
                ),
                child: Text(icon, style: const TextStyle(fontSize: 17)),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Styled select on the field surface. Tapping opens a bottom sheet rather
/// than a Material menu — the native menu renders its own light-mode surface
/// and pops over the field, which reads wrong on these true-black screens.
///
/// [title] labels the sheet; it falls back to [hint] when omitted.
class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    required this.options,
    required this.value,
    required this.onChanged,
    this.hint,
    this.title,
    super.key,
  });

  final List<SelectOption<T>> options;
  final T? value;
  final ValueChanged<T> onChanged;
  final String? hint;
  final String? title;

  @override
  Widget build(BuildContext context) {
    // No firstOrNull here — that extension lives in package:collection, which
    // this file does not depend on.
    SelectOption<T>? selected;
    for (final option in options) {
      if (option.value == value) {
        selected = option;
        break;
      }
    }
    final empty = selected == null;

    return Semantics(
      button: true,
      label: selected?.label ?? hint,
      child: GestureDetector(
        onTap: () => _open(context),
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.field),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selected?.label ?? hint ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: empty ? AppColors.muted2 : AppColors.text,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    final picked = await showModalBottomSheet<SelectOption<T>>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      isScrollControlled: true,
      builder: (_) => _SelectSheet<T>(
        options: options,
        value: value,
        title: title ?? hint,
      ),
    );

    // Wrapped so that dismissing the sheet is distinguishable from picking an
    // option whose value is itself null.
    if (picked != null) onChanged(picked.value);
  }
}

/// The sheet body for [AppDropdown]: grabber, optional title, and one row per
/// option with a lime check against the current value.
class _SelectSheet<T> extends StatelessWidget {
  const _SelectSheet({
    required this.options,
    required this.value,
    this.title,
  });

  final List<SelectOption<T>> options;
  final T? value;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      // Never taller than 80% of the screen; the list scrolls beyond that.
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadii.card),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.switchOff,
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
          ),
          if (title case final title?) ...[
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(title, style: AppText.fieldLabel),
            ),
          ],
          const SizedBox(height: 8),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(12, 4, 12, 12 + inset),
              children: [
                for (final option in options)
                  _SheetRow(
                    label: option.label,
                    selected: option.value == value,
                    onTap: () => Navigator.of(context).pop(option),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetRow extends StatelessWidget {
  const _SheetRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: selected ? AppColors.text : AppColors.textSoft,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check_rounded,
                    size: 20, color: AppColors.lime),
            ],
          ),
        ),
      ),
    );
  }
}

/// Seven circular day toggles. Active fills acid-lime.
class DayToggleGrid extends StatelessWidget {
  const DayToggleGrid({
    required this.labels,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  /// Seven short day labels, Monday first.
  final List<String> labels;

  /// Selected weekday indices, 0 = Monday.
  final Set<int> selected;
  final ValueChanged<Set<int>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < labels.length; i++) ...[
          if (i > 0) const SizedBox(width: 7),
          Expanded(child: AspectRatio(aspectRatio: 1, child: _day(i))),
        ],
      ],
    );
  }

  Widget _day(int index) {
    final active = selected.contains(index);

    return Semantics(
      button: true,
      selected: active,
      label: labels[index],
      child: GestureDetector(
        onTap: () {
          final next = Set<int>.from(selected);
          active ? next.remove(index) : next.add(index);
          onChanged(next);
        },
        child: AnimatedContainer(
          duration: AppMotion.press,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColors.lime : AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(
              color: active ? AppColors.lime : AppColors.line,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              labels[index],
              style: TextStyle(
                fontSize: 12,
                fontWeight: active ? FontWeight.w800 : FontWeight.w400,
                color: active ? Colors.black : AppColors.muted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// iOS-style switch.
class AppSwitch extends StatelessWidget {
  const AppSwitch({required this.value, required this.onChanged, super.key});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      toggled: value,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 30,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: value ? AppColors.green : AppColors.switchOff,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [AppShadows.switchKnob],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Checkbox with an acid tick and an inline label.
class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: value,
              onChanged: (v) => onChanged(v ?? false),
              activeColor: AppColors.lime,
              checkColor: Colors.black,
              side: const BorderSide(color: AppColors.muted2),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppText.bodySm)),
        ],
      ),
    );
  }
}
