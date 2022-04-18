part of 'box_spacer.dart';

enum FruitBoxSpacerSize { xs, s, m, l, xl }

extension StormLayoutSpacerSizeExtension on FruitBoxSpacerSize {
  double get kSize {
    switch (this) {
      case FruitBoxSpacerSize.xs:
        return FruitUnit.xSmall;
      case FruitBoxSpacerSize.s:
        return FruitUnit.small;
      case FruitBoxSpacerSize.m:
        return FruitUnit.medium;
      case FruitBoxSpacerSize.l:
        return FruitUnit.large;
      case FruitBoxSpacerSize.xl:
        return FruitUnit.xLarge;
      default:
        return FruitUnit.medium;
    }
  }
}
