import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/widgets/selection_controls.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

const _equipment = [
  SelectOption(value: 'none', label: 'Không có'),
  SelectOption(value: 'dumbbell', label: 'Tạ đơn'),
  SelectOption(value: 'band', label: 'Dây kháng lực'),
];

void main() {
  group('ChipMultiSelect exclusive option', () {
    testWidgets('an empty selection reads as the exclusive option', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          ChipMultiSelect<String>(
            options: _equipment,
            selected: const {},
            exclusiveValue: 'none',
            onChanged: (_) {},
          ),
        ),
      );

      // "Không có" is shown selected even though the set is empty.
      final chip = tester.widget<SelectChip>(
        find.widgetWithText(SelectChip, 'Không có'),
      );
      expect(chip.selected, isTrue);
    });

    testWidgets('picking a real option clears the exclusive one', (
      tester,
    ) async {
      Set<String> selected = {};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => ChipMultiSelect<String>(
              options: _equipment,
              selected: selected,
              exclusiveValue: 'none',
              onChanged: (v) => setState(() => selected = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tạ đơn'));
      await tester.pump();

      expect(selected, {'dumbbell'});
      expect(
        tester
            .widget<SelectChip>(find.widgetWithText(SelectChip, 'Không có'))
            .selected,
        isFalse,
      );
    });

    testWidgets('picking the exclusive option clears everything else', (
      tester,
    ) async {
      Set<String> selected = {'dumbbell', 'band'};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => ChipMultiSelect<String>(
              options: _equipment,
              selected: selected,
              exclusiveValue: 'none',
              onChanged: (v) => setState(() => selected = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Không có'));
      await tester.pump();

      expect(selected, isEmpty);
    });

    testWidgets('deselecting the last option falls back to exclusive', (
      tester,
    ) async {
      Set<String> selected = {'dumbbell'};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => ChipMultiSelect<String>(
              options: _equipment,
              selected: selected,
              exclusiveValue: 'none',
              onChanged: (v) => setState(() => selected = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tạ đơn'));
      await tester.pump();

      expect(selected, isEmpty);
      expect(
        tester
            .widget<SelectChip>(find.widgetWithText(SelectChip, 'Không có'))
            .selected,
        isTrue,
      );
    });

    testWidgets('multiple non-exclusive options accumulate', (tester) async {
      Set<String> selected = {};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => ChipMultiSelect<String>(
              options: _equipment,
              selected: selected,
              exclusiveValue: 'none',
              onChanged: (v) => setState(() => selected = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tạ đơn'));
      await tester.pump();
      await tester.tap(find.text('Dây kháng lực'));
      await tester.pump();

      expect(selected, {'dumbbell', 'band'});
    });
  });

  group('SegmentedControl', () {
    testWidgets('reports the tapped value', (tester) async {
      String? tapped;
      await tester.pumpWidget(
        _wrap(
          SegmentedControl<String>(
            options: const [
              SelectOption(value: 'male', label: 'Nam'),
              SelectOption(value: 'female', label: 'Nữ'),
            ],
            value: 'male',
            onChanged: (v) => tapped = v,
          ),
        ),
      );

      await tester.tap(find.text('Nữ'));
      expect(tapped, 'female');
    });

    testWidgets('a 2-column layout renders every option', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SegmentedControl<String>(
            columns: 2,
            options: const [
              SelectOption(value: 'a', label: 'Ở nhà'),
              SelectOption(value: 'b', label: 'Phòng gym'),
              SelectOption(value: 'c', label: 'Ngoài trời'),
            ],
            value: 'a',
            onChanged: (_) {},
          ),
        ),
      );

      // An odd count must not drop the trailing option.
      expect(find.text('Ở nhà'), findsOneWidget);
      expect(find.text('Phòng gym'), findsOneWidget);
      expect(find.text('Ngoài trời'), findsOneWidget);
    });
  });

  group('DayToggleGrid', () {
    testWidgets('toggles a day on and off', (tester) async {
      Set<int> days = {0, 2};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => DayToggleGrid(
              labels: const ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
              selected: days,
              onChanged: (v) => setState(() => days = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('T3'));
      await tester.pump();
      expect(days, {0, 1, 2});

      await tester.tap(find.text('T2'));
      await tester.pump();
      expect(days, {1, 2});
    });

    testWidgets('every day can be cleared', (tester) async {
      // Screen 6 must be able to reach an empty set so its validation can fire.
      Set<int> days = {0};
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => DayToggleGrid(
              labels: const ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
              selected: days,
              onChanged: (v) => setState(() => days = v),
            ),
          ),
        ),
      );

      await tester.tap(find.text('T2'));
      await tester.pump();
      expect(days, isEmpty);
    });
  });
}
