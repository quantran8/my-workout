import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/l10n/enum_labels.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../onboarding/models/enums.dart';
import '../../models/session_log.dart';

/// The Mon–Sun dot row: a filled acid dot for a trained day, an acid ring for
/// today, and a faint dot for rest days.
class WeekStrip extends StatelessWidget {
  const WeekStrip({
    required this.log,
    required this.now,
    required this.t,
    super.key,
  });

  final SessionLog log;
  final DateTime now;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    final week = log.weekOf(now);
    final today = DateTime(now.year, now.month, now.day);
    final due = log.dueAsOf(now);
    final done = log.completedAsOf(now);

    // "Complete" only once every scheduled day this week is trained; merely
    // keeping up with what's due so far is "on track".
    final weekDays = week.map((e) => e.$2).nonNulls;
    final summary = done < due.length
        ? t.homeWeekBehind
        : weekDays.isNotEmpty && weekDays.every((d) => d.completed)
        ? t.homeWeekComplete
        : t.homeWeekOnTrack;

    return AccentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (final (date, day) in week)
                Expanded(
                  child: _Day(
                    label: Weekday.values[date.weekday - 1].shortLabel(t),
                    state: switch (day) {
                      null => _DayState.rest,
                      LoggedDay(completed: true) => _DayState.done,
                      _ when day.day == today => _DayState.today,
                      _ when day.day.isBefore(today) => _DayState.missed,
                      _ => _DayState.upcoming,
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(height: 1, color: AppColors.line),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  summary,
                  style: AppText.bodySm,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                t.homeWeekSessions(done, due.length),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DayState { done, today, missed, upcoming, rest }

class _Day extends StatelessWidget {
  const _Day({required this.label, required this.state});

  final String label;
  final _DayState state;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border) = switch (state) {
      _DayState.done => (AppColors.lime, AppColors.bg, null),
      _DayState.today => (
        AppColors.lime.withValues(alpha: 0.06),
        AppColors.lime,
        AppColors.lime,
      ),
      _DayState.missed => (
        AppColors.pink.withValues(alpha: 0.10),
        AppColors.pink,
        null,
      ),
      _DayState.upcoming => (
        AppColors.surface2,
        AppColors.muted,
        null,
      ),
      _DayState.rest => (AppColors.surface2, AppColors.muted2, null),
    };

    final glyph = switch (state) {
      _DayState.done => '✓',
      _DayState.today => '•',
      _DayState.missed => '!',
      _DayState.upcoming => '•',
      _DayState.rest => '·',
    };

    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 11, color: AppColors.muted2),
        ),
        const SizedBox(height: 9),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            border: border == null ? null : Border.all(color: border, width: 1.5),
          ),
          child: Text(
            glyph,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: fg,
            ),
          ),
        ),
      ],
    );
  }
}
