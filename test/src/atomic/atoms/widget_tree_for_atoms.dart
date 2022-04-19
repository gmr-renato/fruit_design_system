import 'package:flutter/material.dart';

class WidgetTreeForAtoms extends StatelessWidget {
  const WidgetTreeForAtoms(
    this.atom, {
    Key? key,
  }) : super(key: key);

  final Widget atom;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Column(children: [atom])),
    );
  }
}
