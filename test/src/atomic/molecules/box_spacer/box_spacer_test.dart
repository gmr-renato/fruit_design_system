import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_design_system/fruit_design_system.dart';

void main() {
  group('Test all FruitBoxSpacer constructors based on FruitUnit -', () {
    _testFruitBoxSpacer(
      'Expect to find one SizedBox of 4x4 with null child when creating a FruitBoxSpace.xSmall()',
      const FruitBoxSpacer.xSmall(),
      4,
    );
    _testFruitBoxSpacer(
      'Expect to find one SizedBox of 8x8 with null child when creating a FruitBoxSpace.small()',
      const FruitBoxSpacer.small(),
      8,
    );
    _testFruitBoxSpacer(
      'Expect to find one SizedBox of 16x16 with null child when creating a FruitBoxSpace()',
      const FruitBoxSpacer(),
      16,
    );
    _testFruitBoxSpacer(
      'Expect to find one SizedBox of 24x24 with null child when creating a FruitBoxSpace.large()',
      const FruitBoxSpacer.large(),
      24,
    );
    _testFruitBoxSpacer(
      'Expect to find one SizedBox matching FruitBoxSpacerSize with null child when creating a FruitBoxSpace.custom(size: FruitBoxSpacerSize)',
      FruitBoxSpacer.custom(size: FruitBoxSpacerSize.xxl),
      64,
    );
  });
}

void _testFruitBoxSpacer(
  String description,
  FruitBoxSpacer boxSpacer,
  double expectedSize,
) {
  testWidgets(
    description,
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Column(children: [boxSpacer])),
        ),
      );

      final Widget widgetFound = find.byType(SizedBox).evaluate().single.widget;
      late final SizedBox? boxFound;

      widgetFound is SizedBox ? boxFound = widgetFound : boxFound = null;

      expect(boxFound?.height == expectedSize, true);
      expect(boxFound?.width == expectedSize, true);
      expect(boxFound?.child, null);
    },
  );
}
