import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class FruitPrimaryButton extends StatelessWidget {
  const FruitPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
  })  : icon = null,
        super(key: key);

  const FruitPrimaryButton.icon({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final text = Text(label);

    final style = ButtonStyle(
      shape: MaterialStateProperty.all(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all(fruitColorScheme.primary),
      foregroundColor: MaterialStateProperty.all(fruitColorScheme.onPrimary),
      elevation: MaterialStateProperty.all(0),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
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
