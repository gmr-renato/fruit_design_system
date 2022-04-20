part of 'theme.dart';

final fruitThemeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: fruitColorScheme.primary,
  colorScheme: fruitColorScheme,
  textTheme: fruitBaseTextTheme,
  appBarTheme: AppBarTheme(
    foregroundColor: fruitColorScheme.onBackground,
    backgroundColor: fruitColorScheme.background,
    elevation: FruitThemeConstants.elevation,
  ),
  disabledColor: fruitColorScheme.secondary.withOpacity(
    FruitThemeConstants.disableSurfaceOpacity,
  ),
  primaryTextTheme: fruitBaseTextTheme,
  primaryColorDark: fruitColorScheme.primary,
  scaffoldBackgroundColor: fruitColorScheme.background,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: fruitColorScheme.secondary,
    foregroundColor: fruitColorScheme.onSecondary,
  ),
  dialogTheme: DialogTheme(
    contentTextStyle: fruitBaseTextTheme.bodyText2,
    titleTextStyle: fruitBaseTextTheme.headline6,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(const StadiumBorder()),
      elevation: MaterialStateProperty.all(FruitThemeConstants.elevation),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    helperStyle: fruitBaseTextTheme.bodyText1,
    labelStyle: fruitBaseTextTheme.bodyText1,
    floatingLabelStyle: fruitBaseTextTheme.bodyText1,
    fillColor: fruitColorScheme.primary,
  ),
);
