import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { light, dark }

mixin AppColors {
  static const Color kBackgroundLightMode = Color(0xFF0497AE);
  static const Color kBackgroundDarkMode = Color(0xFF034B62);

  static ThemeData get lightMode => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundLightMode,
          iconTheme: IconThemeData(color: kBackgroundLightMode),
        ),
        backgroundColor: kBackgroundLightMode,
        textTheme: GoogleFonts.poppinsTextTheme(),
      );

  static ThemeData get darkMode => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundDarkMode,
          iconTheme: IconThemeData(color: kBackgroundDarkMode),
        ),
        backgroundColor: kBackgroundDarkMode,
        textTheme: GoogleFonts.poppinsTextTheme(),
      );
}
