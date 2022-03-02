import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { light, dark }

mixin AppColors {
  static const Color kBackgroundLightMode = Color(0xFF0497AE);
  static const Color kBackgroundDarkMode = Color(0xFF034B62);

  static Color kCardBackground =
      Get.isDarkMode ? const Color(0xFF1E2D33) : Colors.white;

  static ThemeData get lightMode => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundLightMode,
          iconTheme: IconThemeData(color: kBackgroundLightMode),
        ),
        secondaryHeaderColor: const Color(0xFF12C29F),
        cardColor: Colors.white,
        backgroundColor: kBackgroundLightMode,
        textTheme: GoogleFonts.poppinsTextTheme(),
      );

  static ThemeData get darkMode => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundDarkMode,
          iconTheme: IconThemeData(color: kBackgroundDarkMode),
        ),
        secondaryHeaderColor: const Color(0xFF0C705C),
        cardColor: const Color(0xFF1E2D33),
        backgroundColor: kBackgroundDarkMode,
        textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
      );
}
