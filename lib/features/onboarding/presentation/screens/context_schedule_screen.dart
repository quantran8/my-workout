import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../models/enums.dart';
import '../controller/onboarding_controller.dart';

/// Screen 6 — space, equipment, budget and schedule. Determines which exercises
/// can appear at all, so it gates on at least one training day.
class ContextScheduleScreen extends ConsumerStatefulWidget {
  const ContextScheduleScreen({super.key});

  @override
  ConsumerState<ContextScheduleScreen> createState() =>
      _ContextScheduleScreenState();
}

class _ContextScheduleScreenState extends ConsumerState<ContextScheduleScreen> {
  late final TextEditingController _minutes;

  @override
  void initState() {
    super.initState();
    _minutes = TextEditingController(
      text: '${ref.read(onboardingProvider).constraint.schedule.minutesPerSession}',
    );
  }

  @override
  void dispose() {
    _minutes.dispose();
    super.dispose();
  }

  Future<void> _pickTime(String current) async {
    final parts = current.split(':');
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.tryParse(parts.firstOrNull ?? '') ?? 18,
        minute: int.tryParse(parts.elementAtOrNull(1) ?? '') ?? 30,
      ),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: const TimePickerThemeData(
            backgroundColor: AppColors.surface,
          ),
        ),
        child: child!,
      ),
    );
    if (picked == null || !mounted) return;

    final hh = picked.hour.toString().padLeft(2, '0');
    final mm = picked.minute.toString().padLeft(2, '0');
    ref.read(onboardingProvider.notifier).setPreferredTime('$hh:$mm');
  }

  void _continue(int dayCount) {
    if (dayCount == 0) {
      showAppToast(ref, AppLocalizations.of(context).contextNoDaySelected);
      return;
    }
    context.go(Routes.diet);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final notifier = ref.read(onboardingProvider.notifier);
    final c = ref.watch(onboardingProvider).constraint;
    final days = c.schedule.preferredDays;

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.context),
      header: ScreenHeader(
        title: t.contextTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.safety)),
      ),
      footer: PrimaryButton(
        label: t.commonContinue,
        onPressed: () => _continue(days.length),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.contextHeadline, body: t.contextBody),

          // Days first: the schedule is the constraint everything else bends
          // around, so it leads.
          SectionTitle(t.contextDaysLabel),
          DayToggleGrid(
            labels: [for (final day in Weekday.values) day.shortLabel(t)],
            selected: {for (final day in days) Weekday.values.indexOf(day)},
            onChanged: (indices) => notifier.setPreferredDays({
              for (final index in indices) Weekday.values[index],
            }),
          ),
          const SizedBox(height: 8),
          Text(t.contextDayCount(days.length), style: AppText.hint),

          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LabeledField(
                  label: t.contextTimeLabel,
                  child: GestureDetector(
                    onTap: () => _pickTime(c.schedule.preferredTime),
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadii.field),
                        border: Border.all(color: AppColors.line),
                      ),
                      child: Text(
                        c.schedule.preferredTime,
                        style: AppText.input,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.gridGap),
              Expanded(
                child: LabeledField(
                  label: t.contextDurationLabel,
                  child: UnitInput(
                    controller: _minutes,
                    unit: t.unitMinutes,
                    onChanged: (v) => notifier.setMinutesPerSession(
                      int.tryParse(v) ?? c.schedule.minutesPerSession,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SectionTitle(t.contextSpaceLabel),
          SegmentedControl<TrainingSpace>(
            value: c.space,
            // 2x2, not 4-across: at a quarter width the longer labels ellipsis
            // ("Very little space" / "Rất ít chỗ").
            columns: 2,
            onChanged: notifier.setSpace,
            options: [
              for (final space in TrainingSpace.values)
                SelectOption(value: space, label: space.label(t)),
            ],
          ),

          SectionTitle(t.contextEquipmentLabel),
          ChipMultiSelect<Equipment?>(
            selected: c.equipment.cast<Equipment?>().toSet(),
            exclusiveValue: null,
            onChanged: (value) =>
                notifier.setEquipment(value.whereType<Equipment>().toSet()),
            options: [
              SelectOption(value: null, label: t.commonNone),
              for (final item in Equipment.values)
                SelectOption(value: item, label: item.label(t)),
            ],
          ),

          SectionTitle(t.contextBudgetLabel),
          SegmentedControl<BudgetWillingness>(
            value: c.budgetWillingness,
            onChanged: notifier.setBudget,
            options: [
              for (final budget in BudgetWillingness.values)
                SelectOption(value: budget, label: budget.shortLabel(t)),
            ],
          ),
        ],
      ),
    );
  }
}
