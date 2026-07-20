import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../controller/onboarding_controller.dart';

/// Screen 3 — the story and stated goals, in the user's own words.
class StoryGoalScreen extends ConsumerStatefulWidget {
  const StoryGoalScreen({super.key});

  @override
  ConsumerState<StoryGoalScreen> createState() => _StoryGoalScreenState();
}

class _StoryGoalScreenState extends ConsumerState<StoryGoalScreen> {
  late final TextEditingController _story;
  late final TextEditingController _goals;
  bool _seeded = false;

  @override
  void initState() {
    super.initState();
    final data = ref.read(onboardingProvider);
    _story = TextEditingController(text: data.raw.story);
    _goals = TextEditingController(text: data.raw.statedGoal);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The sample text is localized, so it can only be applied once an
    // AppLocalizations is in scope — and only while the fields are still empty.
    if (_seeded) return;
    _seeded = true;

    final t = AppLocalizations.of(context);
    if (_story.text.isNotEmpty || _goals.text.isNotEmpty) return;

    _story.text = t.seedStory;
    _goals.text = t.seedGoals;
    // Riverpod forbids writing to a provider inside a widget lifecycle, so the
    // write is deferred by a microtask rather than to the next frame — a
    // post-frame callback can be skipped entirely during a route transition.
    Future.microtask(() {
      if (context.mounted) _persist();
    });
  }

  @override
  void dispose() {
    _story.dispose();
    _goals.dispose();
    super.dispose();
  }

  void _persist() {
    final notifier = ref.read(onboardingProvider.notifier);
    notifier.setStory(_story.text);
    notifier.setStatedGoal(_goals.text);
  }

  void _continue() {
    if (_story.text.trim().isEmpty) {
      showAppToast(ref, AppLocalizations.of(context).storyRequired);
      return;
    }
    _persist();
    context.go(Routes.basics);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.story),
      header: ScreenHeader(
        title: t.storyTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.welcome)),
      ),
      footer: PrimaryButton(label: t.commonContinue, onPressed: _continue),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.storyHeadline, body: t.storyBody),
          const SizedBox(height: 20),

          // `.stack` — bare labelled fields, no surrounding card.
          LabeledField(
            label: t.storyLabel,
            child: AppTextArea(
              controller: _story,
              hint: t.storyHint,
              minLines: 6,
              maxLines: 10,
              showCounter: true,
              counterBuilder: t.storyCharCount,
              onChanged: (_) => _persist(),
            ),
          ),
          const SizedBox(height: AppSpacing.stackGap),

          LabeledField(
            label: t.storyGoalLabel,
            child: AppTextArea(
              controller: _goals,
              hint: t.storyGoalHint,
              minLines: 4,
              maxLines: 6,
              onChanged: (_) => _persist(),
            ),
          ),
        ],
      ),
    );
  }
}
