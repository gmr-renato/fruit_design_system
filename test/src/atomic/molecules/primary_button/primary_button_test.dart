import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_design_system/src/atomic/molecules/primary_button/primary_button.dart';

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
          final iconFound = find.byType(Icon).evaluate().single.widget;
          final textFound = find.byType(Text).evaluate().single.widget;

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
        'BackgrounColor should be disabled and ForegroundColor should be onDisabled when onPressed is null',
        (WidgetTester tester) async {
          // TODO: implement test
          throw UnimplementedError();
        },
      );
      testWidgets(
        'BackgrounColor should be primary & ForegroundColor should be onPrimary when onPressed is not null',
        (WidgetTester tester) async {
          // TODO: implement test
          throw UnimplementedError();
        },
      );
    },
  );
}
