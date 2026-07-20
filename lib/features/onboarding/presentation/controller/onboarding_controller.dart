import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/computed_rules.dart';
import '../../models/enums.dart';
import '../../models/onboarding_data.dart';

part 'onboarding_controller.g.dart';

/// Single source of truth for everything gathered across the 8 onboarding
/// steps. Held above the router so navigating back to a step — including the
/// arbitrary jumps from the review screen — preserves every entered value.
///
/// keepAlive is essential: under autoDispose the state is discarded whenever no
/// screen is listening, which silently empties the form between steps.
@Riverpod(keepAlive: true)
class Onboarding extends _$Onboarding {
  @override
  OnboardingData build() => const OnboardingData();

  void setEmail(String value) =>
      state = state.copyWith(account: state.account.copyWith(email: value));

  void setStory(String value) =>
      state = state.copyWith(raw: state.raw.copyWith(story: value));

  void setStatedGoal(String value) {
    final raw = state.raw.copyWith(statedGoal: value);
    state = state.copyWith(
      raw: raw,
      // Keep the structured goals in step with the free text.
      target: state.target.copyWith(
        statedGoals: value
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList(),
      ),
    );
  }

  void setSex(Sex value) => _constraint((c) => c.copyWith(sex: value));

  void setAge(int value) => _constraint((c) => c.copyWith(age: value));

  void setHeight(double value) =>
      _constraint((c) => c.copyWith(heightCm: value));

  void setWeight(double value) =>
      _constraint((c) => c.copyWith(weightKg: value));

  void setExperience(ExperienceLevel value) =>
      _constraint((c) => c.copyWith(experienceLevel: value));

  /// Turning injuries off clears the rows outright. Freezed's `copyWith` can't
  /// reset a field to empty implicitly, so this is an explicit mutator rather
  /// than a `copyWith` at the call site.
  void setHasInjury(bool value) => _constraint(
    (c) => value
        ? c.copyWith(
            hasInjury: true,
            // Seed a first row so the form has something to show.
            injuries: c.injuries.isEmpty ? const [Injury()] : c.injuries,
          )
        : c.copyWith(hasInjury: false, injuries: const []),
  );

  void addInjury() => _constraint(
    (c) => c.copyWith(injuries: [...c.injuries, const Injury()]),
  );

  void updateInjury(int index, Injury injury) => _constraint((c) {
    if (index < 0 || index >= c.injuries.length) return c;
    final next = [...c.injuries]..[index] = injury;
    return c.copyWith(injuries: next);
  });

  void removeInjury(int index) => _constraint((c) {
    if (index < 0 || index >= c.injuries.length) return c;
    final next = [...c.injuries]..removeAt(index);
    // Removing the last row is equivalent to answering "no".
    return c.copyWith(injuries: next, hasInjury: next.isNotEmpty);
  });

  void setMobilityLimits(Set<MobilityLimit> value) =>
      _constraint((c) => c.copyWith(mobilityLimits: value));

  void setEquipment(Set<Equipment> value) =>
      _constraint((c) => c.copyWith(equipment: value));

  void setSpace(TrainingSpace value) =>
      _constraint((c) => c.copyWith(space: value));

  void setBudget(BudgetWillingness value) =>
      _constraint((c) => c.copyWith(budgetWillingness: value));

  void setMinutesPerSession(int value) => _constraint(
    (c) => c.copyWith(
      schedule: c.schedule.copyWith(minutesPerSession: value),
    ),
  );

  void setPreferredTime(String value) => _constraint(
    (c) => c.copyWith(schedule: c.schedule.copyWith(preferredTime: value)),
  );

  void setPreferredDays(Set<Weekday> value) => _constraint(
    (c) => c.copyWith(schedule: c.schedule.copyWith(preferredDays: value)),
  );

  void setDietType(DietType value) =>
      _constraint((c) => c.copyWith(diet: c.diet.copyWith(type: value)));

  void setAllergies(String csv) => _constraint(
    (c) => c.copyWith(diet: c.diet.copyWith(allergies: _splitCsv(csv))),
  );

  void setRestrictions(String csv) => _constraint(
    (c) => c.copyWith(diet: c.diet.copyWith(restrictions: _splitCsv(csv))),
  );

  void setConfirmed(bool value) => state = state.copyWith(confirmed: value);

  /// Seeds the sample story used by the prototype. Localized, so it can only be
  /// applied once an [AppLocalizations] is available.
  void seed({required String story, required String goals}) {
    if (state.raw.story.isNotEmpty) return;
    setStory(story);
    setStatedGoal(goals);
  }

  void reset() => state = const OnboardingData();

  void _constraint(Constraint Function(Constraint) update) =>
      state = state.copyWith(constraint: update(state.constraint));

  static List<String> _splitCsv(String csv) => csv
      .split(',')
      .map((part) => part.trim())
      .where((part) => part.isNotEmpty)
      .toList();
}

/// Guardrails derived from the current answers. Screens 8, 9 and 10 all read
/// this, and it recomputes whenever the underlying answers change.
@Riverpod(keepAlive: true)
ComputedRules computedRules(Ref ref) =>
    computeRules(ref.watch(onboardingProvider));
