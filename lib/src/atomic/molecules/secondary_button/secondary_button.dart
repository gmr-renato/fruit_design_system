import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class FruitSecondaryButton extends StatelessWidget {
  const FruitSecondaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
  })  : iconData = null,
        super(key: key);

  const FruitSecondaryButton.icon({
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
      side: MaterialStateProperty.all(
        BorderSide(color: fruitColorScheme.primary),
      ),
      foregroundColor: MaterialStateProperty.all(
        fruitColorScheme.primary,
      ),
      overlayColor: MaterialStateProperty.all(
        fruitColorScheme.primary
            .withOpacity(FruitThemeConstants.primaryOverlayOpacity),
      ),
    );

    if (iconData != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: text,
        style: style,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: text,
      );
    }
  }
}
