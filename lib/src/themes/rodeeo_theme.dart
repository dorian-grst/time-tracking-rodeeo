import 'package:flutter/material.dart';

class RodeeoTheme {
  final ThemeData themeData;

  RodeeoTheme(this.themeData);

  ColorScheme get timeTrackerLightColorScheme {
    return themeData.colorScheme.copyWith(
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

  ColorScheme get timeTrackerDarkColorScheme {
    return themeData.colorScheme.copyWith(
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
      brightness: Brightness.dark,
    );
  }

  final TextStyle primaryStyle = const TextStyle(
    fontFamily: 'RodeeoPrimary',
    package: 'rodeeo_app_ui',
    fontWeight: FontWeight.w900,
  );

  TextStyle get secondaryStyle => primaryStyle.copyWith(
        fontWeight: FontWeight.w400,
      );

  TextStyle get tertiary => primaryStyle.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextTheme timeTrackerTextTheme(ColorScheme colorScheme) {
    final title = primaryStyle.copyWith(fontSize: 32, color: colorScheme.onSurface);
    final subtitle = primaryStyle.copyWith(fontSize: 20, color: colorScheme.onSurface);
    final button = primaryStyle.copyWith(fontSize: 20, color: colorScheme.background);
    final timer = primaryStyle.copyWith(fontSize: 36, color: colorScheme.onSurface);
    final input = primaryStyle.copyWith(
        fontSize: 18, color: colorScheme.surface, fontWeight: FontWeight.w400);
    final card = tertiary.copyWith(fontSize: 18, color: colorScheme.onSurface);
    final small = secondaryStyle.copyWith(fontSize: 16, color: colorScheme.onSurface);

    return themeData.textTheme.copyWith(
      titleLarge: title,
      titleMedium: subtitle,
      displayLarge: timer,
      labelLarge: input,
      labelMedium: button,
      labelSmall: card,
      bodySmall: small,
    );
  }

  ThemeData get light {
    final textTheme = timeTrackerTextTheme(timeTrackerLightColorScheme);
    return themeData.copyWith(
      colorScheme: timeTrackerLightColorScheme,
      textTheme: textTheme,
    );
  }

  ThemeData get dark {
    final textTheme = timeTrackerTextTheme(timeTrackerDarkColorScheme);
    return themeData.copyWith(
      colorScheme: timeTrackerDarkColorScheme,
      textTheme: textTheme,
    );
  }
}
