// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'AI Fitness Coach';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonNone => 'None';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonBack => 'Back';

  @override
  String get commonDelete => 'Remove';

  @override
  String get localeVietnamese => 'VI';

  @override
  String get localeEnglish => 'EN';

  @override
  String get sexMale => 'Male';

  @override
  String get sexFemale => 'Female';

  @override
  String get sexOther => 'Other';

  @override
  String get experienceBeginner => 'Just starting';

  @override
  String get experienceIntermediate => 'Intermediate';

  @override
  String get experienceAdvanced => 'Advanced';

  @override
  String get injuryAreaKnee => 'Knee';

  @override
  String get injuryAreaShoulder => 'Shoulder';

  @override
  String get injuryAreaLowerBack => 'Lower back';

  @override
  String get injuryAreaAnkle => 'Ankle';

  @override
  String get injuryAreaWrist => 'Wrist';

  @override
  String get injuryAreaOther => 'Other';

  @override
  String get severityMild => 'Mild';

  @override
  String get severityModerate => 'Moderate';

  @override
  String get severitySevere => 'Severe';

  @override
  String get mobilityDeepSquat => 'Deep squat is hard';

  @override
  String get mobilityOverhead => 'Overhead reach is hard';

  @override
  String get mobilityHipHinge => 'Hip hinge is hard';

  @override
  String get mobilityRunning => 'Running/jumping is hard';

  @override
  String get equipmentDumbbell => 'Dumbbells';

  @override
  String get equipmentResistanceBand => 'Resistance bands';

  @override
  String get equipmentPullupBar => 'Pull-up bar';

  @override
  String get equipmentFullGym => 'Full gym';

  @override
  String get spaceHome => 'At home';

  @override
  String get spaceGym => 'At a gym';

  @override
  String get spaceOutdoor => 'Outdoors';

  @override
  String get spaceMinimal => 'Very little space';

  @override
  String get budgetNone => 'No — use what I have';

  @override
  String get budgetMinimal => 'Small, low-cost items are fine';

  @override
  String get budgetInvest => 'Happy to invest if needed';

  @override
  String get dietOmnivore => 'Everything';

  @override
  String get dietVegetarian => 'Vegetarian (eggs/dairy)';

  @override
  String get dietVegan => 'Vegan';

  @override
  String get dietPescatarian => 'Pescatarian';

  @override
  String get dietOther => 'Other';

  @override
  String get weekdayMonShort => 'Mon';

  @override
  String get weekdayTueShort => 'Tue';

  @override
  String get weekdayWedShort => 'Wed';

  @override
  String get weekdayThuShort => 'Thu';

  @override
  String get weekdayFriShort => 'Fri';

  @override
  String get weekdaySatShort => 'Sat';

  @override
  String get weekdaySunShort => 'Sun';

  @override
  String get unitYears => 'years';

  @override
  String get unitCm => 'cm';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMinutes => 'min';

  @override
  String get accountEyebrow => 'Your profile will be saved';

  @override
  String get accountHeadline => 'Create an account\nbefore we start.';

  @override
  String get accountBody =>
      'Your plan keeps learning from every session. An account gives your profile and history somewhere to live.';

  @override
  String get accountAppleCta => 'Continue with Apple';

  @override
  String get accountDividerOr => 'or';

  @override
  String get accountEmailHint => 'Your email';

  @override
  String get accountEmailCta => 'Continue with email';

  @override
  String get accountDisclaimer =>
      'Interface demo — no real data is sent or stored.';

  @override
  String get accountInvalidEmail => 'Enter a valid email address';

  @override
  String get welcomeStepBadge => 'FIRST STEP';

  @override
  String get welcomeEyebrow => 'No plan menu to pick from';

  @override
  String get welcomeHeadline => 'Tell us what\nyou\'re dealing with.';

  @override
  String get welcomeBody =>
      'Describe it in your own words. We\'ll only ask for the details we need to build a safe, realistic plan.';

  @override
  String get welcomeCta => 'Tell my story';

  @override
  String get storyTitle => 'Situation & goals';

  @override
  String get storyHeadline => 'What made you want\nto start right now?';

  @override
  String get storyBody =>
      'Describe what you\'re dealing with and the result you\'re after.';

  @override
  String get storyLabel => 'Your situation';

  @override
  String get storyHint =>
      'For example: I started playing football again but I run out of steam fast...';

  @override
  String get storyGoalLabel => 'What do you want to improve?';

  @override
  String get storyGoalHint => 'One goal per line...';

  @override
  String storyCharCount(int count) {
    return '$count characters';
  }

  @override
  String get storyRequired => 'Tell us a little about your situation';

  @override
  String get basicsTitle => 'The basics';

  @override
  String get basicsHeadline => 'A few details\nabout you.';

  @override
  String get basicsBody =>
      'This helps the plan fit your current condition and experience.';

  @override
  String get basicsSexLabel => 'Sex';

  @override
  String get basicsAgeLabel => 'Age';

  @override
  String get basicsExperienceLabel => 'Experience';

  @override
  String get basicsHeightLabel => 'Height';

  @override
  String get basicsWeightLabel => 'Weight';

  @override
  String get safetyTitle => 'Injuries & mobility';

  @override
  String get safetyHeadline => 'Anything we should\nwatch out for?';

  @override
  String get safetyBody =>
      'Tell us about areas that hurt or movements you find difficult.';

  @override
  String get safetyInjuryQuestion => 'Are you dealing with pain or an injury?';

  @override
  String get safetyInjuryNotesHint =>
      'When does it hurt? Which movements bother you?';

  @override
  String get safetyInjuryActive => 'Still symptomatic';

  @override
  String get safetyAddInjury => '+ Add another area';

  @override
  String get safetyExtraInjury => 'Additional area';

  @override
  String get safetyMobilityLabel => 'Movement limits';

  @override
  String get contextTitle => 'Training setup';

  @override
  String get contextHeadline => 'When and where\ncan you train?';

  @override
  String get contextSpaceLabel => 'Main space';

  @override
  String get contextEquipmentLabel => 'Equipment you have';

  @override
  String get contextBudgetLabel => 'Willing to buy more equipment?';

  @override
  String get contextDurationLabel => 'Time per session';

  @override
  String get contextTimeLabel => 'Preferred start time';

  @override
  String get contextDaysLabel => 'Days you can train';

  @override
  String contextDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days selected',
      one: '$count day selected',
    );
    return '$_temp0';
  }

  @override
  String get contextNoDaySelected => 'Pick at least one day you can train';

  @override
  String get dietTitle => 'Nutrition';

  @override
  String get dietHeadline => 'Anything about food\nwe should know?';

  @override
  String get dietBody =>
      'Tell us about your diet, allergies, or anything you need to avoid.';

  @override
  String get dietTypeLabel => 'Diet';

  @override
  String get dietAllergiesLabel => 'Food allergies';

  @override
  String get dietAllergiesHint => 'For example: peanuts, dairy...';

  @override
  String get dietRestrictionsLabel => 'Restrictions or things to avoid';

  @override
  String get dietRestrictionsHint =>
      'For example: can\'t eat a big breakfast, limited spicy food...';

  @override
  String get reviewTitle => 'Confirm your details';

  @override
  String get reviewHeadline => 'Check everything before\nwe build the plan.';

  @override
  String get reviewBody => 'You can go back and edit any section.';

  @override
  String get reviewStorySection => 'Situation & goals';

  @override
  String get reviewBodySection => 'Body & experience';

  @override
  String get reviewSafetySection => 'Injuries & mobility';

  @override
  String get reviewContextSection => 'Training setup';

  @override
  String get reviewDietSection => 'Nutrition';

  @override
  String get reviewNoStory => 'No situation entered yet';

  @override
  String get reviewNoGoals => 'No specific goals yet';

  @override
  String get reviewInjuryLabel => 'Injuries';

  @override
  String get reviewMobilityLabel => 'Movement limits';

  @override
  String get reviewEquipmentLabel => 'Equipment';

  @override
  String get reviewBudgetLabel => 'Buying equipment';

  @override
  String get reviewDurationLabel => 'Session length';

  @override
  String get reviewScheduleLabel => 'Days & time';

  @override
  String get reviewDietTypeLabel => 'Diet';

  @override
  String get reviewAllergiesLabel => 'Allergies';

  @override
  String get reviewRestrictionsLabel => 'Restrictions';

  @override
  String reviewMinutesPerSession(int count) {
    return '$count min / session';
  }

  @override
  String reviewAgeValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years old',
      one: '$count year old',
    );
    return '$_temp0';
  }

  @override
  String get reviewInjuryStillActive => 'still symptomatic';

  @override
  String get reviewInjuryResolved => 'resolved';

  @override
  String get reviewConfirmCheckbox =>
      'I confirm the details above are accurate.';

  @override
  String get reviewGenerateCta => 'Confirm and build my plan';

  @override
  String get loadingEyebrow => 'Building your plan';

  @override
  String get loadingTitle1 => 'Understanding your situation...';

  @override
  String get loadingTitle2 => 'Ordering your priorities...';

  @override
  String get loadingTitle3 => 'Choosing the right exercises...';

  @override
  String get loadingTitle4 => 'Finishing your plan...';

  @override
  String get loadingBody =>
      'Your plan is being arranged around your goals, schedule, and the setup you described.';

  @override
  String get loadingStage1 => 'Identify what you want to improve';

  @override
  String get loadingStage2 => 'Put priorities in order';

  @override
  String get loadingStage3 => 'Pick a schedule and exercises';

  @override
  String get loadingStage4 => 'Finalise your guidance';

  @override
  String get planTitle => 'Your plan';

  @override
  String get planRestart => 'Start over';

  @override
  String get planEyebrow => '8-week roadmap';

  @override
  String get planTimelineEyebrow => 'Progression';

  @override
  String get planTimelineHeadline => 'Two phases, one direction';

  @override
  String get planNeedsEyebrow => 'Goals & priorities';

  @override
  String get planRationaleEyebrow => 'Why this plan fits you';

  @override
  String get planNutritionTitle => 'Daily nutrition targets';

  @override
  String get planCaloriesCaption => 'kcal / day';

  @override
  String get planProteinCaption => 'protein / day';

  @override
  String get planScheduleEyebrow => 'Your schedule';

  @override
  String get planScheduleHint => 'Tap to open';

  @override
  String get planStartCta => 'Start your first session';

  @override
  String get planSavedToast => 'Sample plan saved to your profile';

  @override
  String get planDisclaimer =>
      'This demo plan is sample data illustrating the interface — not medical advice or a real personalised programme.';

  @override
  String get planMetricSessions => 'sessions/week';

  @override
  String get planMetricMinutes => 'per session';

  @override
  String get planMetricWeeks => 'weeks';

  @override
  String planSessionExercises(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercises',
      one: '$count exercise',
    );
    return '$_temp0';
  }

  @override
  String planSetsReps(String sets, String reps) {
    return '$sets × $reps';
  }

  @override
  String get seedStory =>
      'I recently started playing football again but I run out of steam fast and lose every physical duel. I work a desk job, I\'m fairly skinny, and I haven\'t trained consistently in a long time. I want to get stronger and gain weight without losing the endurance I need on the pitch.';

  @override
  String get seedGoals =>
      'Play football stronger without losing weight\nGain weight in a sustainable way';

  @override
  String get planHeadlineStrength =>
      'Build a strength base so you last on the pitch.';

  @override
  String get planHeadlineGeneral =>
      'Build a solid base of fitness to grow from.';

  @override
  String get planSummaryUnderweight =>
      'You\'re underweight for your height, so this plan prioritises building muscle sustainably rather than burning calories. Volume stays manageable so you recover between sessions.';

  @override
  String get planSummaryGeneral =>
      'This plan focuses on foundational strength and endurance, at a volume you can sustain week to week.';

  @override
  String get planRationaleBody =>
      'You train the number of days you selected, for the length you set, so each session is full-body rather than a split. Exercises are chosen around the equipment you have and avoid the movements you flagged as painful or difficult.';

  @override
  String get planPhase1Range => 'Weeks 1–4';

  @override
  String get planPhase1Focus => 'Learn the patterns';

  @override
  String get planPhase1Detail =>
      'Groove the technique at light loads, adding a set per week.';

  @override
  String get planPhase2Range => 'Weeks 5–8';

  @override
  String get planPhase2Focus => 'Build intensity';

  @override
  String get planPhase2Detail =>
      'Add load or reps once you finish every set comfortably.';

  @override
  String get planNeedStrength => 'Build base strength';

  @override
  String get planNeedEndurance => 'Keep your sport endurance';

  @override
  String get planNeedWeightGain => 'Gain weight sustainably';

  @override
  String get planNeedMobility => 'Improve range of motion';

  @override
  String get planNeedInjuryCare => 'Protect the painful area';

  @override
  String get planNutritionSurplus =>
      'Eat slightly above maintenance to gain weight gradually, with protein at every meal.';

  @override
  String get planNutritionMaintain =>
      'Eat around maintenance and keep protein steady to support recovery.';

  @override
  String get planHealthNote =>
      'These numbers are a starting estimate. If you have a medical condition or are under treatment, talk to a doctor before changing your diet.';

  @override
  String get planSessionFullBody => 'Full body';

  @override
  String get planSessionLower => 'Lower body';

  @override
  String get planSessionUpper => 'Upper body';

  @override
  String get exerciseGobletSquat => 'Goblet squat';

  @override
  String get exerciseSplitSquat => 'Split squat';

  @override
  String get exerciseHipHinge => 'Hip hinge';

  @override
  String get exerciseGluteBridge => 'Glute bridge';

  @override
  String get exercisePushup => 'Push-up';

  @override
  String get exerciseInclinePushup => 'Incline push-up';

  @override
  String get exerciseRow => 'Row';

  @override
  String get exerciseOverheadPress => 'Overhead press';

  @override
  String get exercisePlank => 'Plank';

  @override
  String get exerciseDeadBug => 'Dead bug';

  @override
  String get exerciseCalfRaise => 'Calf raise';

  @override
  String get exerciseStepUp => 'Step-up';

  @override
  String get noteLowImpact => 'Low impact on the joints';

  @override
  String get noteControlledRange => 'Keep the range pain-free';

  @override
  String get bmiUnderweight => 'underweight';

  @override
  String get bmiNormal => 'normal';

  @override
  String get bmiOverweight => 'overweight';

  @override
  String get bmiObese => 'obese';

  @override
  String get homeGreeting => 'Today';

  @override
  String get homeNextEyebrowToday => 'Next session · Today';

  @override
  String get homeNextEyebrowTomorrow => 'Next session · Tomorrow';

  @override
  String get homeNextEyebrowRest => 'Rest day';

  @override
  String get homeRestTitle => 'Recovery day';

  @override
  String get homeRestBody =>
      'Recovery is part of the plan. See you at the next session.';

  @override
  String get homeSessionRpe => 'Effort';

  @override
  String get homeStartCta => 'Start session';

  @override
  String get homeViewCta => 'View details';

  @override
  String get homeCompletedCta => 'Completed';

  @override
  String get homeTomorrowToast => 'Tomorrow\'s session isn\'t open yet';

  @override
  String get homeAlreadyLoggedToast => 'You\'ve already logged this session';

  @override
  String homeStreakToast(int count) {
    return 'Current streak: $count weeks';
  }

  @override
  String get homeWeekTitle => 'This week';

  @override
  String get homeWeekPlanLink => 'View plan';

  @override
  String get homeWeekOnTrack => 'On track';

  @override
  String get homeWeekComplete => 'Week complete';

  @override
  String get homeWeekBehind => 'Behind';

  @override
  String homeWeekSessions(int done, int total) {
    return '$done/$total sessions';
  }

  @override
  String get homeStreakLabel => 'Streak';

  @override
  String get homeStreakUnit => 'weeks running';

  @override
  String homeStreakBest(int count) {
    return 'Best: $count weeks';
  }

  @override
  String get homeAdherenceLabel => 'Adherence';

  @override
  String homeAdherenceFoot(int done, int total) {
    return 'Completed $done of $total planned sessions';
  }

  @override
  String get homeProgressTitle => 'Progress';

  @override
  String get homeProgressUpsellLink => 'Upgrade to see details';

  @override
  String get homeProgressProLink => 'Learn about Pro';

  @override
  String get homeProgressQuestion => 'Based on the sessions you\'ve logged';

  @override
  String get homeProgressWindow => 'Last 4 weeks';

  @override
  String get homeVerdictProgressing => 'Yes, you\'re progressing';

  @override
  String get homeVerdictEarly => 'Early positive signal';

  @override
  String get homeVerdictInsufficient => 'Log more sessions to assess this.';

  @override
  String get homeDomainStrength => 'Strength';

  @override
  String get homeDomainEndurance => 'Endurance';

  @override
  String get homeTrendRising => 'Rising';

  @override
  String get homeTrendSteady => 'Steady';

  @override
  String get homeTrendInsufficient => 'Not enough data';

  @override
  String get homeConfidenceLabel => 'Confidence';

  @override
  String get homeConfidenceLow => 'Low';

  @override
  String get homeConfidenceMedium => 'Medium';

  @override
  String get homeLockedTitle => 'Not enough data yet';

  @override
  String get homeLockedReady => 'Enough data to assess.';

  @override
  String homeLockedCounting(int current, int target) {
    return '$current of $target sessions logged';
  }

  @override
  String get homeLockedPreviewStrength => 'Strength will be tracked here.';

  @override
  String get homeLockedPreviewEndurance => 'Endurance will be tracked here.';

  @override
  String get homeUnlockCta => 'Unlock Progress';

  @override
  String get homeUnlockToast => 'Log more sessions to unlock this';

  @override
  String get homeRecentTitle => 'Recent';

  @override
  String get homeRecentEmpty => 'No sessions logged yet.';

  @override
  String homeRecentMeta(int volume, int exercises) {
    return '$volume kg · $exercises exercises';
  }

  @override
  String get homeRecentToast => 'Session details aren\'t in the demo yet';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavPlan => 'Plan';

  @override
  String get homeNavLog => 'Log';

  @override
  String get homeNavProfile => 'Profile';

  @override
  String get homeNavToast => 'This section isn\'t in the demo yet';

  @override
  String get homeProfileToast => 'Profile isn\'t in the demo yet';

  @override
  String get safetyInjurySubtitle => 'Add areas to avoid or go easy on';

  @override
  String get dietOmnivoreSub => 'Meat, fish, eggs or dairy';

  @override
  String get dietVegetarianSub => 'May include eggs or dairy';

  @override
  String get dietVeganSub => 'No animal products';

  @override
  String get dietPescatarianSub => 'Includes fish and seafood';

  @override
  String get dietOtherSub => 'Your own approach';

  @override
  String get contextBody => 'Pick a schedule you can actually keep.';

  @override
  String get budgetNoneShort => 'No';

  @override
  String get budgetMinimalShort => 'A little';

  @override
  String get budgetInvestShort => 'Happy to';

  @override
  String get practiceRestEyebrow => 'Rest';

  @override
  String get practiceRestSkip => 'Skip rest';

  @override
  String get practiceCompleteSet => 'Complete set';

  @override
  String get practiceCardioTitleShort => 'Outdoor run';

  @override
  String get practiceCardioKm => 'km';

  @override
  String get practiceCardioDistanceLabel => 'Distance';

  @override
  String get practiceCardioHrLabel => 'Heart rate · bpm';

  @override
  String get practiceCardioAvgPaceLabel => 'Average pace · /km';

  @override
  String get practiceCardioActiveKcal => 'Active kcal';

  @override
  String get practiceCardioTotalKcal => 'Total kcal';

  @override
  String get practiceCardioLap => 'Mark lap';

  @override
  String get practiceCardioLapToast => 'Lap 1 marked';

  @override
  String get practiceCardioFinish => 'Finish workout';

  @override
  String get practiceCardioInfoEyebrow => 'The run';

  @override
  String get practiceCardioInfoGoal => 'Goal';

  @override
  String get practiceCardioInfoNote =>
      'Pause whenever you need to. End the workout if you feel pain, dizziness or anything unusual.';

  @override
  String get practiceCardioSourceDistance => 'Distance';

  @override
  String get practiceCardioSourceDistanceValue => 'Phone GPS';

  @override
  String get practiceCardioSourceHr => 'Heart rate';

  @override
  String get practiceCardioSourceHrValue => 'Apple Watch';

  @override
  String get practicePause => 'Pause';

  @override
  String get practiceResume => 'Resume';

  @override
  String get practicePausedToast => 'Paused';

  @override
  String get practiceResumedToast => 'Resumed';

  @override
  String get practiceFeedbackEyebrow => 'Quick feedback';

  @override
  String get practiceFeedbackTitle => 'How did this\nfeel?';

  @override
  String get practiceFeedbackOk => 'Fine';

  @override
  String get practiceFeedbackEasy => 'Too easy';

  @override
  String get practiceFeedbackHard => 'Too hard';

  @override
  String get practiceFeedbackUncomfortable => 'Uncomfortable';

  @override
  String practiceFeedbackSaved(String label) {
    return 'Saved: $label';
  }

  @override
  String get practicePainStop => 'In pain — stop the workout';

  @override
  String get practicePainNote =>
      '“In pain” stops the current exercise and flags it for review after the session.';

  @override
  String get practicePainToast => 'Stopped and logged the pain';

  @override
  String get practiceFinishTitle => 'Workout complete';

  @override
  String practiceFinishMeta(int minutes, String distance, String pace) {
    return '$minutes min · $distance km · pace $pace/km';
  }

  @override
  String get practiceEffortQuestion => 'How hard did that feel?';

  @override
  String get practiceSaveWorkout => 'Save workout';

  @override
  String get practiceContinueWorkout => 'Keep training';

  @override
  String get practiceWorkoutSavedToast => 'Workout saved';

  @override
  String get practiceSessionStartError =>
      'Could not start the session. Please try again.';

  @override
  String get practiceHoldBanner => 'Adjusted for how you\'re feeling today';

  @override
  String get practiceRestTitle => 'Rest';

  @override
  String get practiceRestBody => 'Ease off and get ready for the next exercise';

  @override
  String get practiceRestNextLabel => 'Next';

  @override
  String practiceRepsCount(int reps) {
    return '$reps reps';
  }

  @override
  String practiceSecondsCount(int seconds) {
    return '$seconds sec';
  }

  @override
  String get practiceGuideEyebrow => 'Guide';

  @override
  String get practiceGuideSquat1 =>
      'Stand with feet shoulder-width apart, toes turned slightly out.';

  @override
  String get practiceGuideSquat2 =>
      'Push your hips back and lower through a comfortable range of motion.';

  @override
  String get practiceGuideSquat3 =>
      'Keep your chest open, back neutral and knees tracking over your toes.';

  @override
  String get practiceGuidePlank1 =>
      'Set your elbows under your shoulders and hold your body in a straight line.';

  @override
  String get practiceGuidePlank2 =>
      'Gently brace your abs and glutes; don\'t let your hips sag or pike up.';

  @override
  String get practiceGuidePlank3 =>
      'Breathe steadily and hold the position for the time shown.';

  @override
  String get practiceGuideNoteTitle => 'Note';

  @override
  String get practiceGuideNoteBody =>
      'Stop if you feel pain or anything unusual. You don\'t have to force the full count.';

  @override
  String get practiceGuideGotIt => 'Got it';

  @override
  String get practiceExercisePrevious => 'Previous';

  @override
  String get practiceExerciseNext => 'Next';

  @override
  String get practiceOptionsToast => 'Options aren\'t in the demo yet';

  @override
  String get practiceOverviewCategory => 'Full body · Beginner';

  @override
  String get practiceOverviewTitle => 'Full body\nfor beginners';

  @override
  String get practiceOverviewStatLevel => 'Beginner';

  @override
  String get practiceOverviewStatLevelLabel => 'Level';

  @override
  String get practiceOverviewStatDuration => '12 min';

  @override
  String get practiceOverviewStatDurationLabel => 'Duration';

  @override
  String get practiceOverviewStatFocus => 'Full body';

  @override
  String get practiceOverviewStatFocusLabel => 'Focus area';

  @override
  String get practiceOverviewListTitle => 'Exercises';

  @override
  String get practiceOverviewAdjust => 'Adjust';

  @override
  String get practiceOverviewAdjustToast => 'Opening workout adjustments';

  @override
  String get practiceOverviewStart => 'Start';

  @override
  String get practiceOverviewEx1Name => 'Squat';

  @override
  String get practiceOverviewEx1Target => '15 reps';

  @override
  String get practiceOverviewEx1Info =>
      'Keep your feet shoulder-width apart. Push your hips back, lower with your chest open, then drive through your feet to stand.';

  @override
  String get practiceOverviewEx2Name => 'Push-up';

  @override
  String get practiceOverviewEx2Target => '12 reps';

  @override
  String get practiceOverviewEx2Info =>
      'Place your hands slightly wider than your shoulders. Keep your body in one straight line as you lower your chest and press back up.';

  @override
  String get practiceOverviewEx3Name => 'Reverse lunge';

  @override
  String get practiceOverviewEx3Target => '10 reps each side';

  @override
  String get practiceOverviewEx3Info =>
      'Step one foot back and lower both knees with control. Keep your front knee tracking over your foot, then push through the front heel to return.';

  @override
  String get practiceOverviewEx4Name => 'Glute bridge';

  @override
  String get practiceOverviewEx4Target => '15 reps';

  @override
  String get practiceOverviewEx4Info =>
      'Lie on your back with knees bent. Brace your core, squeeze your glutes and lift your hips until shoulders, hips and knees form a straight line.';

  @override
  String get practiceOverviewEx5Name => 'Mountain climber';

  @override
  String get practiceOverviewEx5Target => '30 sec';

  @override
  String get practiceOverviewEx5Info =>
      'Start in a high plank. Alternate driving each knee toward your chest while keeping your shoulders above your hands and your hips steady.';

  @override
  String get practiceOverviewEx6Name => 'Plank';

  @override
  String get practiceOverviewEx6Target => '30 sec';

  @override
  String get practiceOverviewEx6Info =>
      'Set your elbows below your shoulders and hold your body in a straight line. Brace your abs and glutes while breathing steadily.';

  @override
  String get practiceCardioOverviewCategory => 'Cardio · Beginner';

  @override
  String get practiceCardioOverviewStart => 'Start run';

  @override
  String get practiceCardioStatDistanceLabel => 'Distance';

  @override
  String get practiceCardioStatPlaceLabel => 'Location';

  @override
  String get practiceCardioStatPaceLabel => 'Pace';

  @override
  String get practiceCardioStatDurationLabel => 'Duration';

  @override
  String get practiceCardioStatStepsLabel => 'Steps';

  @override
  String get practiceCardioStatRoundsLabel => 'Rounds';

  @override
  String get practiceCardioContinuousListTitle => 'The run';

  @override
  String get practiceCardioStructuredListTitle => 'Steps';

  @override
  String get practiceCardioCaseContinuous => 'Continuous';

  @override
  String get practiceCardioCaseStructured => 'By step';

  @override
  String get practiceCardioContinuousTitle => 'Endurance\n5 km';

  @override
  String get practiceCardioContinuousChip1 => '5 km';

  @override
  String get practiceCardioContinuousChip2 => 'Outdoor';

  @override
  String get practiceCardioContinuousChip3 => 'Free pace';

  @override
  String get practiceCardioContinuousRow1Label => 'Main goal';

  @override
  String get practiceCardioContinuousRow1Value => '5 km distance';

  @override
  String get practiceCardioContinuousRow2Label => 'Live metrics';

  @override
  String get practiceCardioContinuousRow2Value => 'Time · pace';

  @override
  String get practiceCardioContinuousRow3Label => 'Auto-finish';

  @override
  String get practiceCardioContinuousRow3Value => 'At 5 km';

  @override
  String get practiceCardioStructuredEyebrow => 'Structured cardio';

  @override
  String get practiceCardioStructuredTitle => 'Interval\nrun';

  @override
  String get practiceCardioStructuredTitleShort => 'Interval run';

  @override
  String get practiceCardioStructuredChip1 => '30 min';

  @override
  String get practiceCardioStructuredChip2 => '8 steps';

  @override
  String get practiceCardioStructuredChip3 => '3 rounds';

  @override
  String get practiceCardioStepWarmup => 'Warm-up';

  @override
  String get practiceCardioStepWarmupMeta => 'Easy walk · 5 min';

  @override
  String get practiceCardioStepFast => 'Fast run';

  @override
  String get practiceCardioStepFastMeta => '3 min · effort 8/10';

  @override
  String get practiceCardioStepRecover => 'Recovery';

  @override
  String get practiceCardioStepRecoverMeta => 'Walk · 2 min';

  @override
  String get practiceCardioStepCooldown => 'Cool-down';

  @override
  String get practiceCardioStepCooldownMeta => 'Easy walk · 10 min';

  @override
  String practiceCardioRound(int current, int total) {
    return 'Round $current / $total';
  }

  @override
  String practiceCardioStepOf(int current, int total) {
    return 'Step $current / $total';
  }

  @override
  String get practiceCardioRemaining => 'Remaining';

  @override
  String get practiceCardioSkipStep => 'Skip current step';

  @override
  String get authLoginEyebrow => 'Welcome back';

  @override
  String get authLoginHeadline => 'Sign in\nto continue.';

  @override
  String get authLoginBody => 'Your plan and training history are waiting.';

  @override
  String get authRegisterEyebrow => 'Start your journey';

  @override
  String get authRegisterHeadline => 'Create a free\naccount.';

  @override
  String get authRegisterBody =>
      'Your plan keeps learning from every session. An account gives your profile and history somewhere to live.';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint => 'At least 8 characters';

  @override
  String get authConfirmPasswordLabel => 'Confirm password';

  @override
  String get authConfirmPasswordHint => 'Re-enter your password';

  @override
  String get authFullNameLabel => 'Display name';

  @override
  String get authFullNameHint => 'Your name (optional)';

  @override
  String get authLoginCta => 'Sign in';

  @override
  String get authRegisterCta => 'Create account';

  @override
  String get authToRegister => 'No account yet? Sign up';

  @override
  String get authToLogin => 'Already have an account? Sign in';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get authLogoutCta => 'Sign out';

  @override
  String get authErrorInvalidEmail => 'Enter a valid email address';

  @override
  String get authErrorPasswordTooShort =>
      'Password must be at least 8 characters';

  @override
  String get authErrorPasswordMismatch => 'Passwords do not match';

  @override
  String get authErrorInvalidCredentials => 'Incorrect email or password';

  @override
  String get authErrorEmailTaken => 'That email is already registered';

  @override
  String get authErrorWeakPassword => 'That password is not strong enough';

  @override
  String get authErrorNetwork =>
      'Could not reach the server. Check your connection and try again.';

  @override
  String get authErrorUnknown => 'Something went wrong. Please try again.';

  @override
  String get authNeedsEmailConfirm =>
      'Check your inbox to confirm your email, then sign in.';

  @override
  String get authRegisterSuccess => 'Account created';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileEyebrow => 'Your account';

  @override
  String get profileAccountSection => 'Account';

  @override
  String get profileEmailLabel => 'Email';

  @override
  String get profileNameLabel => 'Name';

  @override
  String get profileProviderLabel => 'Signed in with';

  @override
  String get profileNamePlaceholder => 'Not set';

  @override
  String get profileSignOutSection => 'Session';

  @override
  String get profileSignOutHint =>
      'Sign out on this device. Your plan and history stay safe on your account.';

  @override
  String get reviewSavingCta => 'Saving your profile…';

  @override
  String get profileSaveErrorNetwork =>
      'Could not reach the server. Check your connection and try again.';

  @override
  String get profileSaveErrorUnauthorized =>
      'Your session expired. Please sign in again.';

  @override
  String get profileSaveErrorUnknown =>
      'Could not save your profile. Please try again.';

  @override
  String get planGenerateErrorNetwork =>
      'Could not reach the server. Check your connection and try again.';

  @override
  String get planGenerateErrorUnknown =>
      'Could not generate your plan. Please try again.';

  @override
  String get basicsRecentActivityLabel => 'Recent activity level';

  @override
  String get basicsRecentActivityHelp =>
      'How active have you been over the past 3 months? This is asked separately from experience — years of training followed by a long break still needs an easier restart.';

  @override
  String get recentActivityVeryLow => 'Barely active';

  @override
  String get recentActivityLow => 'Some walking, little training';

  @override
  String get recentActivityModerate => 'Training 1–2 times a week';

  @override
  String get recentActivityHigh => 'Training 3+ times a week';

  @override
  String get recentActivityVeryLowShort => 'Very low';

  @override
  String get recentActivityLowShort => 'Low';

  @override
  String get recentActivityModerateShort => 'Moderate';

  @override
  String get recentActivityHighShort => 'High';

  @override
  String get basicsDetrainingLabel => 'Last trained consistently';

  @override
  String get basicsDetrainingHelp =>
      'After a break of 3 months or more, the program starts lighter to let your body re-adapt.';

  @override
  String get detrainingNone => 'Training consistently now';

  @override
  String get detrainingUnderMonth => 'Less than a month ago';

  @override
  String get detrainingOneToThreeMonths => '1–3 months ago';

  @override
  String get detrainingThreeToTwelveMonths => '3–12 months ago';

  @override
  String get detrainingOverYear => 'Over a year ago';

  @override
  String get reviewRecentActivityLabel => 'Recent activity';

  @override
  String get reviewDetrainingLabel => 'Last consistent training';

  @override
  String get readinessTitle => 'Before you train';

  @override
  String get readinessHeadline => 'How are you today?';

  @override
  String get readinessBody =>
      'A few quick questions so the session fits how you feel. Skip and the program will reduce the load to stay safe.';

  @override
  String get readinessDiscomfortQuestion =>
      'Anything sore or uncomfortable right now?';

  @override
  String get readinessAreaLabel => 'Affected area';

  @override
  String get readinessSeverityLabel => 'Severity';

  @override
  String get readinessAffectsMovement => 'Affects normal movement';

  @override
  String get readinessSorenessLabel => 'Soreness left from last session';

  @override
  String get readinessSorenessHigh => 'High';

  @override
  String get readinessEnergyLabel => 'Energy level';

  @override
  String get readinessEnergyLow => 'Low';

  @override
  String get readinessEnergyOk => 'Normal';

  @override
  String get readinessEnergyHigh => 'High';

  @override
  String get readinessExternalLoadsLabel => 'Other factors';

  @override
  String get readinessPoorSleep => 'Poor sleep';

  @override
  String get readinessHighStress => 'High stress';

  @override
  String get readinessIllness => 'Feeling ill';

  @override
  String get readinessContinue => 'Continue';

  @override
  String get readinessSkip => 'Skip';

  @override
  String get readinessHoldTitle => 'Better to rest today';

  @override
  String get readinessModifiedTitle => 'Session adjusted';

  @override
  String get painDetailEyebrow => 'Stopping for pain';

  @override
  String get painDetailTitle => 'Where does it hurt?';

  @override
  String get painDetailAreaLabel => 'Area';

  @override
  String get painDetailSeverityLabel => 'Pain level';

  @override
  String get painDetailSeverityHelp =>
      '1 = slightly uncomfortable · 5 = severe';

  @override
  String get painDetailConfirm => 'Record and stop';

  @override
  String get painDetailSkip => 'Stop without details';

  @override
  String get bodyAreaHip => 'Hip';

  @override
  String get bodyAreaElbow => 'Elbow';

  @override
  String get bodyAreaNeck => 'Neck';

  @override
  String get bodyAreaUpperBack => 'Upper back';

  @override
  String get practiceSessionLoadError =>
      'Could not load the session. Check your connection and try again.';

  @override
  String get unitSecondsShort => 's';

  @override
  String get unitMinutesShort => 'm';

  @override
  String get practiceOverviewStatExercisesLabel => 'Exercises';

  @override
  String get practiceOverviewStatSetsLabel => 'Total sets';

  @override
  String get practiceOverviewNoGuide =>
      'No detailed guide for this exercise yet.';
}
