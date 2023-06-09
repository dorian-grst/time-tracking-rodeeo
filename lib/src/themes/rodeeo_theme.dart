import 'package:flutter/material.dart';
import '/src/utils/constants/chart_text_style.dart';
import '/src/utils/constants/chart_colors.dart';
import '/src/utils/extensions/string_extension.dart';

class RodeeoTheme {
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

  static ColorScheme get primaryColorScheme => ColorScheme.fromSwatch(primarySwatch: primarySwatch);

  static ColorScheme get timeTrackerLightColorScheme {
    return primaryColorScheme.copyWith(
      primary: const Color.fromRGBO(47, 147, 92, 1),
      onPrimary: const Color.fromRGBO(222, 255, 225, 1),
      secondary: const Color.fromRGBO(245, 180, 0, 1),
      onSecondary: const Color.fromRGBO(255, 122, 0, 1),
      tertiary: const Color.fromRGBO(229, 91, 91, 1),
      onTertiary: const Color.fromRGBO(107, 19, 0, 1),
      surface: const Color.fromRGBO(229, 229, 229, 1), //darkWhite
      onSurface: Colors.black,
      inverseSurface: Colors.transparent,
      background: const Color.fromRGBO(251, 250, 255, 1), //lightWhite
      onBackground: Colors.white,
      error: Colors.red,
      onError: const Color.fromRGBO(255, 239, 241, 1),
      errorContainer: Colors.grey,
      onErrorContainer: const Color.fromARGB(255, 230, 230, 230),
      brightness: Brightness.light,
    );
  }

  static ColorScheme get timeTrackerDarkColorScheme {
    return primaryColorScheme.copyWith(
      primary: const Color.fromRGBO(47, 147, 92, 1),
      onPrimary: const Color.fromRGBO(222, 255, 225, 1),
      secondary: const Color.fromRGBO(245, 180, 0, 1),
      onSecondary: const Color.fromRGBO(255, 122, 0, 1),
      tertiary: const Color.fromRGBO(229, 91, 91, 1),
      onTertiary: const Color.fromRGBO(107, 19, 0, 1),
      surface: const Color.fromARGB(231, 232, 232, 232), //darkBlack
      onSurface: Colors.white,
      inverseSurface: Colors.transparent,
      background: const Color.fromRGBO(47, 49, 54, 1), //lightBlack
      onBackground: const Color.fromRGBO(64, 68, 75, 1),
      error: Colors.red,
      onError: const Color.fromRGBO(255, 239, 241, 1),
      errorContainer: Colors.grey,
      onErrorContainer: Colors.white,
      brightness: Brightness.light,
    );
  }

  static ThemeData lightTheme = ThemeData(
    colorScheme: timeTrackerLightColorScheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: timeTrackerDarkColorScheme,
  );

  /*
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
  */

  static TextTheme extendedTextTheme(TextTheme textTheme, ThemeData themeData) {
    final colorScheme = themeData.colorScheme;
    final title = primaryStyle.copyWith(fontSize: 60, color: colorScheme.onSurface);
    final subtitle = primaryStyle.copyWith(fontSize: 20, color: colorScheme.onSurface);
    final timer = primaryStyle.copyWith(fontSize: 36, color: colorScheme.onSurface);
    final input = primaryStyle.copyWith(fontSize: 18, color: colorScheme.surface);
    final small = secondaryStyle.copyWith(fontSize: 16, color: colorScheme.onSurface);

    return textTheme.copyWith(
      titleLarge: title,
      titleMedium: subtitle,
      displayLarge: timer,
      labelLarge: input,
      bodySmall: small,
    );
  }

  /*
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
  TextStyle? overline,
})
*/
}
