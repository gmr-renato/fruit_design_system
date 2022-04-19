part of 'box_spacer.dart';

enum FruitBoxSpacerSize { xxs, xs, s, m, l, xl, xxl }

extension StormLayoutSpacerSizeExtension on FruitBoxSpacerSize {
  double get kSize {
    switch (this) {
      case FruitBoxSpacerSize.xxs:
        return FruitUnit.xxSmall;
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
      case FruitBoxSpacerSize.xxl:
        return FruitUnit.xxLarge;
      default:
        return FruitUnit.medium;
    }
  }
}
