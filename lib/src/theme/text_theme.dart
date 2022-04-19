part of 'theme.dart';

TextTheme fruitBaseTextTheme = Typography.material2018().black.apply(
      bodyColor: fruitColorScheme.onSurface,
      displayColor: fruitColorScheme.onSurfaceVariant,
    );
TextTheme fruitHighlightTextTheme = Typography.material2018().black.apply(
      bodyColor: fruitColorScheme.primary,
      displayColor: fruitColorScheme.secondary,
    );

TextTheme fruitOnPrimaryTextTheme = Typography.material2018().white.apply(
      bodyColor: fruitColorScheme.onPrimary,
      displayColor: fruitColorScheme.onPrimaryContainer,
    );
TextTheme fruitOnSecondaryTextTheme = Typography.material2018().white.apply(
      bodyColor: fruitColorScheme.onSecondary,
      displayColor: fruitColorScheme.onSecondaryContainer,
    );
