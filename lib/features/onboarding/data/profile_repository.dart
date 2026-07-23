import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_provider.dart';
import '../models/onboarding_data.dart';
import 'profile_mapper.dart';

part 'profile_repository.g.dart';

/// The saved profile as the backend echoes it back: the stored profile plus the
/// server-computed BMI and red flags.
///
/// `redFlags` stays as raw maps — they are policy payloads the plan pipeline
/// consumes, and the onboarding UI only needs to know whether any exist.
class SavedProfile {
  const SavedProfile({required this.bmi, required this.redFlags});

  factory SavedProfile.fromJson(Map<String, dynamic> json) => SavedProfile(
    bmi: (json['bmi'] as num?)?.toDouble(),
    redFlags: [
      for (final flag in (json['flags'] as List<dynamic>? ?? const []))
        flag as Map<String, dynamic>,
    ],
  );

  final double? bmi;
  final List<Map<String, dynamic>> redFlags;

  /// True when the backend raised at least one high-severity flag — the cases
  /// that warrant a medical referral before training.
  bool get hasHighSeverityFlag =>
      redFlags.any((flag) => flag['severity'] == 'high');
}

class ProfileRepository {
  const ProfileRepository(this._dio);

  final Dio _dio;

  /// `PUT /profile` — persists the confirmed answers. The backend recomputes
  /// BMI and red flags from what is sent and returns them.
  ///
  /// [now] anchors the derived `lastConsistentTrainingAt`; it defaults to the
  /// current time and exists so tests can pin it.
  Future<SavedProfile> save(OnboardingData data, {DateTime? now}) async {
    final response = await _dio.put<Map<String, dynamic>>(
      '/profile',
      data: {
        ...ProfileMapper.profileToJson(data, now: now ?? DateTime.now()),
        // Kept server-side for audit and re-analysis. The goals are already
        // structured into `target.statedGoals`, so both halves of what the user
        // typed are preserved.
        'rawOnboarding': _rawOnboarding(data),
      },
    );
    return SavedProfile.fromJson(response.data!);
  }

  /// `GET /profile` — the current stored profile. Returns null when the user
  /// has not completed onboarding yet (the backend answers 404).
  Future<SavedProfile?> fetch() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/profile');
      return SavedProfile.fromJson(response.data!);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  static String _rawOnboarding(OnboardingData data) {
    final story = data.raw.story.trim();
    final goals = data.raw.statedGoal.trim();
    if (story.isEmpty) return goals;
    if (goals.isEmpty) return story;
    return '$story\n\n$goals';
  }
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) =>
    ProfileRepository(ref.watch(dioProvider));
