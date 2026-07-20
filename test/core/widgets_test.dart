import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/theme/tokens.dart';
import 'package:mobile/core/widgets/loader_ring.dart';

import 'package:mobile/core/widgets/noise_background.dart';
import 'package:mobile/core/widgets/screen_enter.dart';
import 'package:mobile/core/widgets/screen_scaffold.dart';
import 'package:mobile/core/widgets/stage_check_row.dart';
import 'package:mobile/core/widgets/toast.dart';

Widget _wrap(Widget child) =>
    ProviderScope(child: MaterialApp(home: Scaffold(body: child)));

void main() {
  group('ScreenEnter', () {
    testWidgets('animates from faded to fully opaque', (tester) async {
      await tester.pumpWidget(_wrap(const ScreenEnter(child: Text('hi'))));

      // First frame: transparent and offset.
      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.0);

      await tester.pumpAndSettle();
      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 1.0);
    });

    testWidgets('a delayed entrance disposed mid-delay does not throw', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const ScreenEnter(
            delay: Duration(milliseconds: 200),
            child: Text('hi'),
          ),
        ),
      );
      // Tear down before the delay fires — the timer must not touch a disposed
      // controller.
      await tester.pumpWidget(_wrap(const SizedBox()));
      await tester.pump(const Duration(milliseconds: 400));
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('NoiseBackground renders its child over the base colour', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(const NoiseBackground(child: Text('body'))));

    expect(find.text('body'), findsOneWidget);
    // Scope to the widget's own fill — the MaterialApp wrapper contributes its
    // own (transparent) ColoredBoxes.
    final fill = tester.widget<ColoredBox>(
      find.descendant(
        of: find.byType(NoiseBackground),
        matching: find.byType(ColoredBox),
      ).first,
    );
    expect(fill.color, AppColors.bg);
  });

  testWidgets('ScreenScaffold shows header, body and footer', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const ScreenScaffold(
          header: ScreenHeader(title: 'Header'),
          body: Text('Body'),
          footer: Text('Footer'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);
    expect(find.text('Footer'), findsOneWidget);
  });

  group('StageCheckRow', () {
    testWidgets('pending shows its index, done shows a check', (tester) async {
      await tester.pumpWidget(
        _wrap(const StageCheckRow(index: 2, label: 'Step', done: false)),
      );
      expect(find.text('2'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsNothing);

      await tester.pumpWidget(
        _wrap(const StageCheckRow(index: 2, label: 'Step', done: true)),
      );
      await tester.pumpAndSettle();
      expect(find.text('2'), findsNothing);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });
  });

  testWidgets('LoaderRing and LoadingDots animate without throwing', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const Column(children: [LoaderRing(size: 100), LoadingDots()]),
      ),
    );

    // Both repeat forever, so step frames rather than settling.
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 700));
    expect(tester.takeException(), isNull);
    expect(find.byType(LoaderRing), findsOneWidget);

    // Unmount cleanly — repeating controllers must be disposed.
    await tester.pumpWidget(_wrap(const SizedBox()));
    expect(tester.takeException(), isNull);
  });

  group('Toast', () {
    testWidgets('shows a message then auto-hides', (tester) async {
      late WidgetRef ref;
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Consumer(
              builder: (context, r, _) {
                ref = r;
                return const ToastHost(child: Scaffold(body: SizedBox()));
              },
            ),
          ),
        ),
      );

      expect(ref.read(toastProvider), isNull);

      showAppToast(ref, 'Saved');
      await tester.pump();
      expect(find.text('Saved'), findsOneWidget);
      expect(ref.read(toastProvider), 'Saved');

      // Auto-hide at 2.2s.
      await tester.pump(AppMotion.toastVisible);
      await tester.pumpAndSettle();
      expect(ref.read(toastProvider), isNull);
    });

    testWidgets('a second toast resets the dismiss timer', (tester) async {
      late WidgetRef ref;
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Consumer(
              builder: (context, r, _) {
                ref = r;
                return const ToastHost(child: Scaffold(body: SizedBox()));
              },
            ),
          ),
        ),
      );

      showAppToast(ref, 'First');
      await tester.pump(const Duration(milliseconds: 1500));
      showAppToast(ref, 'Second');

      // The first toast's original deadline passes; the second must survive it.
      await tester.pump(const Duration(milliseconds: 1000));
      expect(ref.read(toastProvider), 'Second');

      await tester.pump(AppMotion.toastVisible);
      await tester.pumpAndSettle();
      expect(ref.read(toastProvider), isNull);
    });
  });
}
