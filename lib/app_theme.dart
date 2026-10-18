import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:java_gem/app_colors.dart';

final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorPalette.brown,
    onPrimary: Colors.white,
    secondary: ColorPalette.lightBrown,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white.withAlpha(247),
    onSurface: ColorPalette.darkGray,
    onSurfaceVariant: ColorPalette.lightGrey
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: GoogleFonts.soraTextTheme().copyWith(
    headlineLarge: GoogleFonts.sora(fontSize: 32, height: 1.15, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.sora(fontSize: 24, height: 1.2, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.sora(fontSize: 18, height: 0.7, fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.sora(fontSize: 15, height: 1.6, fontWeight: FontWeight.w400),
    labelSmall: GoogleFonts.sora(fontSize: 11, height: 1.4, fontWeight: FontWeight.w500, letterSpacing: 0.99),
    labelLarge: GoogleFonts.sora(fontSize: 13, height: 1.0, fontWeight: FontWeight.w500),
  ),

  cardTheme: CardThemeData(
    color: lightColorScheme.surface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w500),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // Text and icon color
      backgroundColor: ColorPalette.brown,

      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded edges
      ),
    ),
  )
);