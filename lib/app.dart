import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/l10n/locale_controller.dart';
import 'core/theme/app_scroll_behavior.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/toast.dart';
import 'l10n/app_localizations.dart';
import 'router.dart';

class FitnessApp extends ConsumerStatefulWidget {
  const FitnessApp({super.key});

  @override
  ConsumerState<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends ConsumerState<FitnessApp> {
  // Read, not watched: rebuilding the router on every locale change would
  // reset the navigation stack.
  late final _router = ref.read(routerProvider);

  @override
  Widget build(BuildContext context) {
    // null => follow the device locale.
    final locale = ref.watch(localeControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      scrollBehavior: const AppScrollBehavior(),
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      routerConfig: _router,
      // One toast host above every route, so a toast raised during navigation
      // survives the transition.
      builder: (context, child) => ToastHost(child: child ?? const SizedBox()),
    );
  }
}
