import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FruitPrimaryButton extends StatelessWidget {
  const FruitPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(fruitColorScheme.primary),
        foregroundColor: MaterialStateProperty.all(fruitColorScheme.onPrimary),
        elevation: MaterialStateProperty.all(0),
      ),
    );
  }
}
