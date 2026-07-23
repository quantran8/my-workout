import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/practice_mapper.dart';

/// Where it hurts and how badly, asked after the user taps "dừng vì đau".
///
/// The backend's `RecordFeedbackDto` accepts `bodyArea` and `severity` and uses
/// them to block the affected movement pattern in later sessions — without them
/// a pain-stop records only that *something* hurt, which is far less actionable.
class PainDetail {
  const PainDetail({required this.area, required this.severity});

  final BodyArea area;

  /// 1–5, matching the DTO's `@Min(1) @Max(5)`.
  final int severity;
}

Future<PainDetail?> showPainDetailSheet(BuildContext context) =>
    showModalBottomSheet<PainDetail>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.70),
      isScrollControlled: true,
      builder: (context) => const _PainDetailSheet(),
    );

class _PainDetailSheet extends StatefulWidget {
  const _PainDetailSheet();

  @override
  State<_PainDetailSheet> createState() => _PainDetailSheetState();
}

class _PainDetailSheetState extends State<_PainDetailSheet> {
  BodyArea? _area;
  int _severity = 3;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final inset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, inset + 24),
      decoration: const BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.muted2,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            t.painDetailEyebrow.toUpperCase(),
            style: AppText.eyebrow.copyWith(color: AppColors.pink),
          ),
          const SizedBox(height: 8),
          Text(t.painDetailTitle, style: AppText.titleSm),
          const SizedBox(height: 20),

          Text(t.painDetailAreaLabel, style: AppText.fieldLabel),
          const SizedBox(height: 8),
          AppDropdown<BodyArea>(
            value: _area ?? BodyArea.knee,
            title: t.painDetailAreaLabel,
            onChanged: (value) => setState(() => _area = value),
            options: [
              for (final area in BodyArea.values)
                SelectOption(value: area, label: area.label(t)),
            ],
          ),
          const SizedBox(height: 18),

          Text(t.painDetailSeverityLabel, style: AppText.fieldLabel),
          const SizedBox(height: 8),
          Row(
            children: [
              for (var i = 1; i <= 5; i++) ...[
                if (i > 1) const SizedBox(width: 8),
                Expanded(child: _severityDot(i)),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(t.painDetailSeverityHelp, style: AppText.hint),
          const SizedBox(height: 24),

          PrimaryButton(
            label: t.painDetailConfirm,
            onPressed: () => Navigator.of(context).pop(
              PainDetail(area: _area ?? BodyArea.knee, severity: _severity),
            ),
          ),
          const SizedBox(height: 8),
          // Skipping still stops the session — it only omits the detail.
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                t.painDetailSkip,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.muted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _severityDot(int value) {
    final selected = _severity == value;
    return GestureDetector(
      onTap: () => setState(() => _severity = value),
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.pink
              : Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(AppRadii.small),
        ),
        child: Text(
          '$value',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : AppColors.muted,
          ),
        ),
      ),
    );
  }
}

extension BodyAreaL10n on BodyArea {
  String label(AppLocalizations t) => switch (this) {
    BodyArea.knee => t.injuryAreaKnee,
    BodyArea.shoulder => t.injuryAreaShoulder,
    BodyArea.lowerBack => t.injuryAreaLowerBack,
    BodyArea.hip => t.bodyAreaHip,
    BodyArea.elbow => t.bodyAreaElbow,
    BodyArea.wrist => t.injuryAreaWrist,
    BodyArea.ankle => t.injuryAreaAnkle,
    BodyArea.neck => t.bodyAreaNeck,
    BodyArea.upperBack => t.bodyAreaUpperBack,
  };
}
