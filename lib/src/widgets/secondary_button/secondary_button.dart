import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FruitSecondaryButton extends StatelessWidget {
  const FruitSecondaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
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
      ),
    );
  }
}
