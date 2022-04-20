import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class FruitPrimaryButton extends StatelessWidget {
  const FruitPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
  })  : iconData = null,
        super(key: key);

  const FruitPrimaryButton.icon({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    final text = Text(label);

    final style = ButtonStyle(
      shape: MaterialStateProperty.all(const StadiumBorder()),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return fruitThemeData.disabledColor;
          } else {
            return fruitColorScheme.primary;
          }
        },
      ),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return fruitColorScheme.secondary.withOpacity(
              FruitThemeConstants.disableTextOpacity,
            );
          } else {
            return fruitColorScheme.onPrimary;
          }
        },
      ),
      elevation: MaterialStateProperty.all(0),
    );

    if (iconData != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: text,
        style: style,
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: style,
      );
    }
  }
}
