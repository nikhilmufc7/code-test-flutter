import 'package:flutter/material.dart';
import 'package:code_test_flutter/src/app/core/gen/colors.gen.dart';

abstract class GradientColors {
  static const primary = [
    Color(0xFF822FA3),
    Color(0xFFEF5984),
    Color(0xFFFF3F5C)
  ];
}

abstract class Gradients {
  static const darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [ColorName.surface, Colors.transparent],
  );
}
