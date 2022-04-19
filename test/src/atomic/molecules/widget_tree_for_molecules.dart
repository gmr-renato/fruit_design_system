import 'package:flutter/material.dart';
import 'package:fruit_design_system/fruit_design_system.dart';

class WidgetTreeForMolecules extends StatelessWidget {
  const WidgetTreeForMolecules(
    this.molecule, {
    Key? key,
  }) : super(key: key);

  final Widget molecule;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FruitTheme().themeData,
      home: Scaffold(body: Column(children: [molecule])),
    );
  }
}
