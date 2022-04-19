import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_design_system/src/atomic/molecules/primary_button/primary_button.dart';

import '../widget_tree_for_molecules.dart';

void main() {
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
}
