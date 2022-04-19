import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_design_system/fruit_design_system.dart';

import '../widget_tree_for_molecules.dart';

void main() {
  group(
    'SecondaryButton layout structure -',
    () {
      testWidgets(
        'FruitSecondaryButton() should builds an outlined button with the given string',
        (WidgetTester tester) async {
          const label = 'Test string %%';
          final testingWidget = FruitSecondaryButton(
            onPressed: () {},
            label: label,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byType(OutlinedButton),
          );
          final textFound = tester.firstWidget(find.byType(Text));

          expect(elevatedButtonFound is OutlinedButton, true);

          expect(textFound is Text, true);
          expect((textFound as Text).data, label);
        },
      );
      testWidgets(
        'FruitSecondaryButton.icon() should builds an outlined button with the given string & iconData',
        (WidgetTester tester) async {
          const label = 'Test string %%';
          const iconData = Icons.add;
          final testingWidget = FruitSecondaryButton.icon(
            onPressed: () {},
            label: label,
            iconData: iconData,
          );

          await tester.pumpWidget(WidgetTreeForMolecules(testingWidget));

          final elevatedButtonFound = tester.firstWidget(
            find.byWidgetPredicate(
              (widget) => '${widget.runtimeType}' == '_OutlinedButtonWithIcon',
            ),
          );
          final iconFound = find.byType(Icon).evaluate().single.widget;
          final textFound = find.byType(Text).evaluate().single.widget;

          expect(elevatedButtonFound is OutlinedButton, true);

          expect(textFound is Text, true);
          expect((textFound as Text).data, label);

          expect(iconFound is Icon, true);
          expect((iconFound as Icon).icon, iconData);
        },
      );
    },
  );
}
