import 'package:apprentissage/src/utils/extensions/string_extension.dart';
import 'package:flutter/widgets.dart';

import 'chart_colors.dart';

final BorderRadiusGeometry kBorderRadiusMedium = BorderRadius.circular(12.0);

final kBoxShadow = BoxShadow(
  color: kCharteNeutre02.hexColor.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 2,
  offset: const Offset(0, 1),
);
