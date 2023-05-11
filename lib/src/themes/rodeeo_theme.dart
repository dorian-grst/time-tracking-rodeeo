import 'package:flutter/material.dart';
import '/src/utils/constants/additional_colors.dart';
import '/src/utils/constants/chart_text_style.dart';
import '/src/utils/constants/chart_colors.dart';
import '/src/utils/extensions/string_extension.dart';

class RodeoTheme {
  static dynamic get primaryColor => kChartePrimaire00.hexColor;

  static MaterialColor get primarySwatch {
    final swatch = {
      50: kCharteNuance01.hexColor,
      100: kCharteNuance02.hexColor,
      200: kCharteNuance03.hexColor,
      300: kCharteNuance04.hexColor,
      400: kCharteNuance05.hexColor,
      500: kCharteNuance06.hexColor,
      600: kCharteNuance07.hexColor,
      700: kCharteNuance08.hexColor,
      800: kCharteNuance09.hexColor,
    };

    return MaterialColor(400, swatch);
  }

  static ColorScheme get primaryColorScheme =>
      ColorScheme.fromSwatch(primarySwatch: primarySwatch);

  static ColorScheme get rodeeoColorScheme {
    return primaryColorScheme.copyWith(
      primary: kChartePrimaire00.hexColor,
      onPrimary: kChartePrimaire04.hexColor,
      secondary: kChartePrimaire01.hexColor,
      onSecondary: kChartePrimaire04.hexColor,
      tertiary: kChartePrimaire02.hexColor,
      onTertiary: kChartePrimaire00.hexColor,
      surface: kChartePrimaire04.hexColor,
      onSurface: kCharteNeutre04.hexColor,
      inverseSurface: kCharteNeutre09.hexColor, // White
      background: kCharteNeutre08.hexColor, // border
      onBackground: kCharteNeutre02.hexColor, // Muted
      error: kRedWarningColor,
      onError: kCharteNeutre08.hexColor,
      errorContainer: kCharteTertiaire02.hexColor,
      onErrorContainer: kDarkBlueColor,
      brightness: Brightness.light,
    );
  }

  static ColorScheme extendedColorScheme(ColorScheme colorScheme) {
    return colorScheme.copyWith(
      primary: kChartePrimaire00.hexColor,
      onPrimary: kChartePrimaire04.hexColor,
      secondary: kChartePrimaire01.hexColor,
      onSecondary: kChartePrimaire04.hexColor,
      tertiary: kChartePrimaire02.hexColor,
      onTertiary: kChartePrimaire00.hexColor,
      surface: kChartePrimaire04.hexColor,
      onSurface: kCharteNeutre04.hexColor,
      inverseSurface: kCharteNeutre09.hexColor, // White
      background: kCharteNeutre08.hexColor, // border
      onBackground: kCharteNeutre02.hexColor, // Muted
      error: kRedWarningColor,
      onError: kCharteNeutre08.hexColor,
      errorContainer: kCharteTertiaire02.hexColor,
      onErrorContainer: kDarkBlueColor,
      brightness: Brightness.light,
    );
  }

  static TextTheme extendedTextTheme(TextTheme textTheme) {
    // as of now title => Primary Poppins
    // as of now display => Secondary => Roboto
    final primaryBold = primaryStyle.copyWith(fontWeight: FontWeight.w700);
    final primaryMedium = primaryStyle.copyWith(fontWeight: FontWeight.w500);
    final primaryLight = primaryStyle.copyWith(fontWeight: FontWeight.w300);
    final secondaryBold = secondaryStyle.copyWith(fontWeight: FontWeight.w700);
    final secondaryMedium =
        secondaryStyle.copyWith(fontWeight: FontWeight.w500);
    final secondaryLight = secondaryStyle.copyWith(fontWeight: FontWeight.w300);
    return textTheme.copyWith(
      displayLarge: primaryBold,
      displayMedium: primaryMedium,
      displaySmall: primaryLight,
      titleLarge: secondaryBold,
      titleMedium: secondaryMedium,
      titleSmall: secondaryLight,
    );
  }

  static ButtonStyle rodeeoButtonStyle(ThemeData data) {
    final textTheme = extendedTextTheme(data.textTheme);
    return ButtonStyle(
      alignment: Alignment.center,
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.only(bottom: 8.0)),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? rodeeoColorScheme.secondary
            : rodeeoColorScheme.surface;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? rodeeoColorScheme.onBackground
            : rodeeoColorScheme.onSurface;
      }),
      textStyle: MaterialStateProperty.all(
        textTheme.displayMedium?.copyWith(fontSize: 17),
      ),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(
          color: rodeeoColorScheme.onSurface, //color
          width: 0.5,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // radius you want
        ),
      ),
    );
  }

  /*
​
TextTheme copyWith({
  TextStyle? displayLarge,
  TextStyle? displayMedium,
  TextStyle? displaySmall,
  TextStyle? headlineLarge,
  TextStyle? headlineMedium,
  TextStyle? headlineSmall,
  TextStyle? titleLarge,
  TextStyle? titleMedium,
  TextStyle? titleSmall,
  TextStyle? bodyLarge,
  TextStyle? bodyMedium,
  TextStyle? bodySmall,
  TextStyle? labelLarge,
  TextStyle? labelMedium,
  TextStyle? labelSmall,
  TextStyle? headline1,
  TextStyle? headline2,
  TextStyle? headline3,
  TextStyle? headline4,
  TextStyle? headline5,
  TextStyle? headline6,
  TextStyle? subtitle1,
  TextStyle? subtitle2,
  TextStyle? bodyText1,
  TextStyle? bodyText2,
  TextStyle? caption,
  TextStyle? button,
  TextStyle? overline,
})
​
    */

  static ThemeData extendedTheme(ThemeData data) {
    return data.copyWith(
      colorScheme: rodeeoColorScheme,
      textTheme: extendedTextTheme(data.textTheme),
      segmentedButtonTheme:
          SegmentedButtonThemeData(style: rodeeoButtonStyle(data)),
    );
  }
}
