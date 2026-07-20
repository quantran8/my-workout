import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/progress_report.dart';

/// Free tier: the app is visibly still logging sessions, with the analysis
/// blurred behind an unlock. The count is real — the value is withheld, not the
/// user's data.
class LockedProgressCard extends StatelessWidget {
  const LockedProgressCard({
    required this.report,
    required this.onUnlock,
    required this.t,
    super.key,
  });

  final ProgressReport report;
  final VoidCallback onUnlock;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.violet.withValues(alpha: 0.11),
            Colors.white.withValues(alpha: 0.035),
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(color: AppColors.violet.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.violet.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 18,
                  color: Color(0xFFC7B7FF),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.homeLockedTitle,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      report.hasBaseline
                          ? t.homeLockedReady
                          : t.homeLockedCounting(
                              report.baselineSessions,
                              kProgressBaseline,
                            ),
                      style: AppText.bodySm,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Decorative only — the real values live behind the paywall, so this
          // is excluded from the semantics tree rather than read aloud.
          ExcludeSemantics(
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
              child: Opacity(
                opacity: 0.48,
                child: Row(
                  children: [
                    Expanded(
                      child: _PreviewDomain(
                        label: t.homeDomainStrength,
                        value: t.homeLockedPreviewStrength,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _PreviewDomain(
                        label: t.homeDomainEndurance,
                        value: t.homeLockedPreviewEndurance,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: FilledButton(
              onPressed: onUnlock,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF111111),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.field),
                ),
              ),
              child: Text(
                t.homeUnlockCta,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewDomain extends StatelessWidget {
  const _PreviewDomain({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.055),
        borderRadius: BorderRadius.circular(AppRadii.field),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11, color: AppColors.muted),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// Paid tier: the verdict, per-domain trends, and how much to trust them.
class UnlockedProgressCard extends StatelessWidget {
  const UnlockedProgressCard({
    required this.report,
    required this.t,
    super.key,
  });

  final ProgressReport report;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.homeProgressQuestion.toUpperCase(),
                      style: AppText.eyebrow.copyWith(
                        fontSize: 11,
                        letterSpacing: 11 * 0.04,
                        color: AppColors.violet,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      switch (report.verdict) {
                        ProgressVerdict.progressing => t.homeVerdictProgressing,
                        ProgressVerdict.earlySignal => t.homeVerdictEarly,
                        ProgressVerdict.insufficient =>
                          t.homeVerdictInsufficient,
                      },
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.08,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 22 * -0.035,
                        leadingDistribution: TextLeadingDistribution.even,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                t.homeProgressWindow,
                style: TextStyle(fontSize: 11, color: AppColors.muted),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _DomainRow(
            label: t.homeDomainStrength,
            trend: report.strength.trend,
            color: AppColors.lime,
            t: t,
          ),
          const SizedBox(height: 8),
          _DomainRow(
            label: t.homeDomainEndurance,
            trend: report.endurance.trend,
            color: AppColors.cyan,
            t: t,
          ),
          const SizedBox(height: 13),
          Divider(height: 1, color: AppColors.line),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.homeConfidenceLabel,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                ),
              ),
              Text(
                switch (report.confidence) {
                  ProgressConfidence.medium => t.homeConfidenceMedium,
                  ProgressConfidence.low => t.homeConfidenceLow,
                },
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSoft,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DomainRow extends StatelessWidget {
  const _DomainRow({
    required this.label,
    required this.trend,
    required this.color,
    required this.t,
  });

  final String label;
  final TrendDirection trend;
  final Color color;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    final rising = trend == TrendDirection.rising;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(AppRadii.field),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 9),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (rising)
                const Icon(
                  Icons.arrow_outward_rounded,
                  size: 14,
                  color: AppColors.lime,
                ),
              if (rising) const SizedBox(width: 2),
              Text(
                switch (trend) {
                  TrendDirection.rising => t.homeTrendRising,
                  TrendDirection.steady => t.homeTrendSteady,
                  TrendDirection.insufficient => t.homeTrendInsufficient,
                },
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: rising ? AppColors.lime : AppColors.muted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
