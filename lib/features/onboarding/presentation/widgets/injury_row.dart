import 'package:flutter/material.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/enums.dart';
import '../../models/onboarding_data.dart';

/// `.injury-card` — one injury: area, severity, a short note, and whether it is
/// still symptomatic. Repeated via the "+ add another area" row.
class InjuryRow extends StatefulWidget {
  const InjuryRow({
    required this.injury,
    required this.onChanged,
    this.onRemove,
    super.key,
  });

  final Injury injury;
  final ValueChanged<Injury> onChanged;

  /// Null when this is the only row — answering "no" clears the section
  /// instead of deleting the last card.
  final VoidCallback? onRemove;

  @override
  State<InjuryRow> createState() => _InjuryRowState();
}

class _InjuryRowState extends State<InjuryRow> {
  late final TextEditingController _notes = TextEditingController(
    text: widget.injury.notes,
  );

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final injury = widget.injury;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.field),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // `.injury-head`
          Row(
            children: [
              Expanded(
                child: Text(t.safetyExtraInjury, style: AppText.fieldLabel),
              ),
              if (widget.onRemove case final remove?)
                DeleteButton(onTap: remove, semanticLabel: t.commonDelete),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: AppDropdown<InjuryArea>(
                  value: injury.area,
                  onChanged: (v) => widget.onChanged(injury.copyWith(area: v)),
                  options: [
                    for (final area in InjuryArea.values)
                      SelectOption(value: area, label: area.label(t)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppDropdown<InjurySeverity>(
                  value: injury.severity,
                  onChanged: (v) =>
                      widget.onChanged(injury.copyWith(severity: v)),
                  options: [
                    for (final severity in InjurySeverity.values)
                      SelectOption(value: severity, label: severity.label(t)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          AppTextField(
            controller: _notes,
            hint: t.safetyInjuryNotesHint,
            onChanged: (v) => widget.onChanged(injury.copyWith(notes: v)),
          ),
          const SizedBox(height: 10),

          AppCheckbox(
            value: injury.active,
            label: t.safetyInjuryActive,
            onChanged: (v) => widget.onChanged(injury.copyWith(active: v)),
          ),
        ],
      ),
    );
  }
}
