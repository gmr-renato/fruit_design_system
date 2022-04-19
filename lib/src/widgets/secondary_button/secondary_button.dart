import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FruitSecondaryButton extends StatelessWidget {
  const FruitSecondaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
  })  : icon = null,
        super(key: key);

  const FruitSecondaryButton.icon({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final Text label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final _style = ButtonStyle(
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
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: label,
        style: _style,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        child: label,
        style: _style,
      );
    }
  }
}
