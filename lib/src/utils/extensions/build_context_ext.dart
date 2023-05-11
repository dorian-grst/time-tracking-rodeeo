import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get margin => screenWidth * .05;

  TextStyle? get displayRobotoStyle => Theme.of(this).textTheme.displayMedium;
  TextStyle? get titlePopinsStyle => Theme.of(this).textTheme.titleMedium;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
