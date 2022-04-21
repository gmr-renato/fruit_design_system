import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_design_system/fruit_design_system.dart';

import '../widget_tree_for_molecules.dart';

void main() {
  group(
    'PrimaryButton functionality -',
    () {
      testWidgets(
        'Should complete the onPressed after button is tapped (sync onPressed',
        (WidgetTester tester) async {
          const buttonText = 'Tap to test';
          final completer = Completer<void>();

          final testingWidget = FruitPrimaryButton(
            onPressed: () => completer.complete(),
            label: buttonText,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));
          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();

          expect(completer.isCompleted, true);
        },
      );
      testWidgets(
        'Counter should be 1 after button is tapped (test sync onPressed)',
        (WidgetTester tester) async {
          const buttonText = 'Tap to test';
          int counter = 0;

          final testingWidget = FruitPrimaryButton(
            onPressed: () => counter++,
            label: buttonText,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));
          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();

          expect(counter, 1);
        },
      );
      testWidgets(
        'Counter should be 1 after button is tapped (test async onPressed)',
        (WidgetTester tester) async {
          const buttonText = 'Tap to test';
          const delayInMilliseconds = 100;
          int counter = 0;

          final testingWidget = FruitPrimaryButton(
            onPressed: () async => Future.delayed(
              const Duration(milliseconds: delayInMilliseconds),
            ).then((value) => counter++),
            label: buttonText,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));
          await tester.tap(find.byType(ElevatedButton));

          expect(counter, 0);
          await tester.pump(
            const Duration(milliseconds: delayInMilliseconds + 1),
          );

          expect(counter, 1);
        },
      );
    },
  );

  group(
    'PrimaryButton layout structure -',
    () {
      testWidgets(
        'FruitPrimaryButton() should builds a elevated button with the given string',
        (WidgetTester tester) async {
          const label = 'Test stringn %%';
          final testingWidget = FruitPrimaryButton(
            onPressed: () {},
            label: label,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byType(ElevatedButton),
          );
          final textFound = tester.firstWidget(find.byType(Text));

          expect(elevatedButtonFound is ElevatedButton, true);

          expect(textFound is Text, true);
          expect((textFound as Text).data, label);
        },
      );
      testWidgets(
        'FruitPrimaryButton.icon() should builds a elevated button with the given string & icon',
        (WidgetTester tester) async {
          const label = 'Test stringn %%';
          const iconData = Icons.add;
          final testingWidget = FruitPrimaryButton.icon(
            onPressed: () {},
            label: label,
            iconData: iconData,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byWidgetPredicate(
              (widget) => '${widget.runtimeType}' == '_ElevatedButtonWithIcon',
            ),
          );
          final iconFound = tester.firstWidget(find.byType(Icon));
          final textFound = tester.firstWidget(find.byType(Text));

          expect(elevatedButtonFound is ElevatedButton, true);

          expect(textFound is Text, true);
          expect((textFound as Text).data, label);

          expect(iconFound is Icon, true);
          expect((iconFound as Icon).icon, iconData);
        },
      );
    },
  );
  group(
    'PrimaryButton design -',
    () {
      testWidgets(
        'Validate BackgrounColor as primary & ForegroundColor as onPrimary when onPressed is not null',
        (WidgetTester tester) async {
          const label = 'Test';
          final testingWidget = FruitPrimaryButton(
            onPressed: () => debugPrint(label),
            label: label,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byType(ElevatedButton),
          );
          final textFound = tester.firstWidget(find.byType(Text));

          final buttonStyle = (elevatedButtonFound as ElevatedButton).style;
          final textStyle = (textFound as Text).style;

          // HACK: hard compare properties using .toString() because
          // the expected() method return false when comparing runtime type
          // check: https://stackoverflow.com/questions/68942228/flutter-widget-test-of-elevated-button-color
          expect(
            buttonStyle?.backgroundColor.toString(),
            fruitColorScheme.primary.toString(),
          );
          expect(
            buttonStyle?.foregroundColor.toString(),
            fruitColorScheme.onPrimary.toString(),
          );

          expect(textStyle, null);
        },
      );
      testWidgets(
        'Validate BackgrounColor & ForegroundColor as disabled when onPressed is null',
        (WidgetTester tester) async {
          const label = 'Test';
          const testingWidget = FruitPrimaryButton(
            onPressed: null,
            label: label,
          );

          await tester.pumpWidget(const WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byType(ElevatedButton),
          );
          final textFound = tester.firstWidget(find.byType(Text));

          final buttonStyle = (elevatedButtonFound as ElevatedButton).style;
          final textStyle = (textFound as Text).style;

          // HACK: hard compare properties using .toString() because
          // the expected() method return false when comparing runtime type
          // check: https://stackoverflow.com/questions/68942228/flutter-widget-test-of-elevated-button-color

          // FIXME: this test is failing because button style is returning
          // the color for enabled button
          expect(
            buttonStyle?.backgroundColor.toString(),
            fruitThemeData.disabledColor.toString(),
          );
          expect(
            buttonStyle?.foregroundColor.toString(),
            fruitColorScheme.onPrimary.toString(),
          );

          expect(textStyle, null);
        },
      );
    },
  );
}
