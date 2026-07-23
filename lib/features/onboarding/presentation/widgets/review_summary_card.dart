import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';

/// One label/value pair inside a [ReviewSummaryCard].
class ReviewRow {
  const ReviewRow(this.label, this.value);

  final String label;
  final String value;
}

/// A read-only summary of one onboarding section.
///
/// The section title doubles as an edit affordance: tapping the trailing link
/// jumps straight back to the step that owns these answers.
class ReviewSummaryCard extends StatelessWidget {
  const ReviewSummaryCard({
    required this.title,
    required this.editRoute,
    required this.editLabel,
    required this.rows,
    this.child,
    super.key,
  });

  final String title;
  final String editRoute;
  final String editLabel;
  final List<ReviewRow> rows;

  /// Content in place of [rows] — the story card uses it for free text and
  /// goal chips.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: Row(
            children: [
              Expanded(child: Text(title, style: AppText.sectionTitle)),
              GestureDetector(
                // `go`, not `push`: this replaces rather than stacking, so the
                // back affordance on the target step stays meaningful.
                onTap: () => context.go(editRoute),
                child: Padding(
                  // Widens the tap target without shifting the layout.
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                  child: Text(
                    editLabel,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lime,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.card),
            border: Border.all(color: AppColors.line),
          ),
          child: child != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(18, 17, 18, 17),
                  child: child,
                )
              : Column(
                  children: [
                    for (final (index, row) in rows.indexed)
                      _Row(row: row, last: index == rows.length - 1),
                  ],
                ),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.row, required this.last});

  final ReviewRow row;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(bottom: BorderSide(color: Color(0x0FFFFFFF))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Flexible: a long localized label ("Last consistent training")
          // otherwise pushes the value column off the card.
          Flexible(
            child: Text(
              row.label,
              style: const TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              row.value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
