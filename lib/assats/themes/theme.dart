import 'package:flutter/material.dart';
import 'package:incase_app/assats/colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: white,
        fontFamily: 'Product_Sans',
        appBarTheme: const AppBarTheme(color: white),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(grey),
        ),
        textTheme: const TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        ),
        colorScheme: const ColorScheme(
          background: white,
          brightness: Brightness.light,
          primary: white,
          secondary: black,
          error: Colors.red,
          surface: white,
          onPrimary: white,
          onSecondary: black,
          onBackground: white,
          onError: Colors.red,
          onSurface: white,
        ),
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const displayMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: grey,
  );
  static const displaySmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: grey,
  );
  static const headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headlineSmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.015,
    color: white,
  );
  static const titleLarge = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: black,
  );
  static const bodyLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: grey,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: grey,
  );

  static const titleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static const bodySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: black,
  );

  static const labelLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: black,
  );
}
