import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'access_controller.g.dart';

/// What the user has paid for. Free still logs every session — only the
/// Progress *analysis* is gated, so the paywall never costs the user data.
enum AccessTier { free, paid }

@Riverpod(keepAlive: true)
class Access extends _$Access {
  @override
  AccessTier build() => AccessTier.free;

  void toggle() =>
      state = state == AccessTier.free ? AccessTier.paid : AccessTier.free;
}
