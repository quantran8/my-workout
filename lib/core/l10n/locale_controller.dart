import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

/// Selected UI locale. `null` means "follow the device locale", which is the
/// default; [set] overrides it for the session (not persisted).
@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale? build() => null;

  void set(Locale? locale) => state = locale;
}
