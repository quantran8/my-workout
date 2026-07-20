/// Sessions of the same movement pattern needed before any trend is claimed.
/// Below this the honest answer is "not enough data", not a flat line.
const kProgressBaseline = 3;

/// Sessions needed before a *second* domain (endurance) and a confident overall
/// verdict are supportable.
const kProgressConfidentBaseline = 4;

enum TrendDirection { rising, steady, insufficient }

enum ProgressVerdict { progressing, earlySignal, insufficient }

enum ProgressConfidence { low, medium }

/// A trained capacity and its recent direction.
class ProgressDomain {
  const ProgressDomain({required this.trend});

  final TrendDirection trend;
}

/// The answer to "am I making progress?", derived purely from how many
/// comparable sessions exist. Verdict, per-domain trends and confidence all
/// step up together at the same thresholds, so the card can never show a
/// confident verdict over "insufficient" domains.
class ProgressReport {
  const ProgressReport({
    required this.verdict,
    required this.strength,
    required this.endurance,
    required this.confidence,
    required this.baselineSessions,
  });

  factory ProgressReport.from(int baselineSessions) {
    final confident = baselineSessions >= kProgressConfidentBaseline;
    final enough = baselineSessions >= kProgressBaseline;

    return ProgressReport(
      verdict: switch (baselineSessions) {
        >= kProgressConfidentBaseline => ProgressVerdict.progressing,
        >= kProgressBaseline => ProgressVerdict.earlySignal,
        _ => ProgressVerdict.insufficient,
      },
      strength: ProgressDomain(
        trend: enough ? TrendDirection.rising : TrendDirection.insufficient,
      ),
      endurance: ProgressDomain(
        trend: confident ? TrendDirection.steady : TrendDirection.insufficient,
      ),
      confidence: confident
          ? ProgressConfidence.medium
          : ProgressConfidence.low,
      baselineSessions: baselineSessions,
    );
  }

  final ProgressVerdict verdict;
  final ProgressDomain strength;
  final ProgressDomain endurance;
  final ProgressConfidence confidence;
  final int baselineSessions;

  /// Whether enough data exists to show the analysis at all. Drives the "n/3
  /// sessions" line on the locked card.
  bool get hasBaseline => baselineSessions >= kProgressBaseline;
}
