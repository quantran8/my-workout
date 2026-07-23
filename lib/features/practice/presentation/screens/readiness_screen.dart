import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/practice_mapper.dart';
import '../widgets/pain_detail_sheet.dart';

/// The readiness gate (§5.1), asked before a session starts.
///
/// This is a safety input, not a formality: the answers drive
/// `assessReadiness`, which can reduce volume, swap in regressions, or hold the
/// session entirely. Skipping it makes the backend assume the conservative
/// "unknown" branch and cap volume at 70%.
class ReadinessScreen extends ConsumerStatefulWidget {
  const ReadinessScreen({required this.onSubmit, required this.onSkip, super.key});

  /// Receives the collected answers; the caller owns the network call so this
  /// screen stays pure.
  final ValueChanged<ReadinessAnswers> onSubmit;
  final VoidCallback onSkip;

  @override
  ConsumerState<ReadinessScreen> createState() => _ReadinessScreenState();
}

class _ReadinessScreenState extends ConsumerState<ReadinessScreen> {
  bool _hasDiscomfort = false;
  BodyArea _area = BodyArea.knee;
  DiscomfortSeverity _severity = DiscomfortSeverity.mild;
  bool _affectsMovement = false;

  ResidualSoreness _soreness = ResidualSoreness.none;
  EnergyLevel _energy = EnergyLevel.ok;
  bool _poorSleep = false;
  bool _highStress = false;
  bool _illness = false;

  ReadinessAnswers get _answers => ReadinessAnswers(
    discomforts: _hasDiscomfort
        ? [
            ReportedDiscomfort(
              area: _area,
              severity: _severity,
              affectsNormalMovement: _affectsMovement,
            ),
          ]
        : const [],
    residualSoreness: _soreness,
    energyLevel: _energy,
    poorSleep: _poorSleep,
    highStress: _highStress,
    illness: _illness,
  );

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ScreenScaffold(
      header: ScreenHeader(title: t.readinessTitle),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            label: t.readinessContinue,
            onPressed: () => widget.onSubmit(_answers),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: widget.onSkip,
            child: Text(
              t.readinessSkip,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.muted,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.readinessHeadline, body: t.readinessBody),
          const SizedBox(height: 20),

          // --- Discomfort ---------------------------------------------------
          InputCard(
            child: _SwitchRow(
              value: _hasDiscomfort,
              label: t.readinessDiscomfortQuestion,
              onChanged: (value) => setState(() => _hasDiscomfort = value),
            ),
          ),
          if (_hasDiscomfort) ...[
            const SizedBox(height: 12),
            LabeledField(
              label: t.readinessAreaLabel,
              child: AppDropdown<BodyArea>(
                value: _area,
                title: t.readinessAreaLabel,
                onChanged: (value) => setState(() => _area = value),
                options: [
                  for (final area in BodyArea.values)
                    SelectOption(value: area, label: area.label(t)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            LabeledField(
              label: t.readinessSeverityLabel,
              child: SegmentedControl<DiscomfortSeverity>(
                value: _severity,
                onChanged: (value) => setState(() => _severity = value),
                options: [
                  for (final value in DiscomfortSeverity.values)
                    SelectOption(value: value, label: value.label(t)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // The backend escalates to a `hold` verdict on this answer, so it
            // is the most consequential control on the screen.
            InputCard(
              child: _SwitchRow(
                value: _affectsMovement,
                label: t.readinessAffectsMovement,
                onChanged: (value) => setState(() => _affectsMovement = value),
              ),
            ),
          ],
          const SizedBox(height: 22),

          // --- Soreness / energy --------------------------------------------
          LabeledField(
            label: t.readinessSorenessLabel,
            child: SegmentedControl<ResidualSoreness>(
              value: _soreness,
              onChanged: (value) => setState(() => _soreness = value),
              options: [
                for (final value in ResidualSoreness.values)
                  SelectOption(value: value, label: value.label(t)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: t.readinessEnergyLabel,
            child: SegmentedControl<EnergyLevel>(
              value: _energy,
              onChanged: (value) => setState(() => _energy = value),
              options: [
                for (final value in EnergyLevel.values)
                  SelectOption(value: value, label: value.label(t)),
              ],
            ),
          ),
          const SizedBox(height: 22),

          // --- External loads -----------------------------------------------
          Text(t.readinessExternalLoadsLabel, style: AppText.fieldLabel),
          const SizedBox(height: 8),
          InputCard(
            child: Column(
              children: [
                _SwitchRow(
                  value: _poorSleep,
                  label: t.readinessPoorSleep,
                  onChanged: (value) => setState(() => _poorSleep = value),
                ),
                const Divider(color: AppColors.line, height: 20),
                _SwitchRow(
                  value: _highStress,
                  label: t.readinessHighStress,
                  onChanged: (value) => setState(() => _highStress = value),
                ),
                const Divider(color: AppColors.line, height: 20),
                _SwitchRow(
                  value: _illness,
                  label: t.readinessIllness,
                  onChanged: (value) => setState(() => _illness = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Label + trailing switch, matching the row the safety screen composes inline.
class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 12),
        AppSwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}

extension _SeverityL10n on DiscomfortSeverity {
  String label(AppLocalizations t) => switch (this) {
    DiscomfortSeverity.mild => t.severityMild,
    DiscomfortSeverity.moderate => t.severityModerate,
    DiscomfortSeverity.severe => t.severitySevere,
  };
}

extension _SorenessL10n on ResidualSoreness {
  String label(AppLocalizations t) => switch (this) {
    ResidualSoreness.none => t.commonNone,
    ResidualSoreness.mild => t.severityMild,
    ResidualSoreness.moderate => t.severityModerate,
    ResidualSoreness.high => t.readinessSorenessHigh,
  };
}

extension _EnergyL10n on EnergyLevel {
  String label(AppLocalizations t) => switch (this) {
    EnergyLevel.low => t.readinessEnergyLow,
    EnergyLevel.ok => t.readinessEnergyOk,
    EnergyLevel.high => t.readinessEnergyHigh,
  };
}
