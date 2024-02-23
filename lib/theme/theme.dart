import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    applyElevationOverlayColor: true,
    brightness: Brightness.light,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: const MaterialColor(
      0xFFE0E0E0, // Set the primary color to white
      <int, Color>{
        50: Color(0xFFFAFAFA),
        100: Color(0xFFF5F5F5),
        200: Color(0xFFEAEAEA),
        300: Color(0xFFE0E0E0),
        400: Color(0xFFD6D6D6),
        500: Color(0xFFCCCCCC),
        600: Color(0xFFC2C2C2),
        700: Color(0xFFB8B8B8),
        800: Color(0xFFADADAD),
        900: Color(0xFFA3A3A3),
      },
    ),
    primaryColorLight: const Color.fromARGB(255, 60, 185, 79),
    primaryColorDark: const Color.fromARGB(255, 131, 130, 128),
    canvasColor: const Color.fromARGB(255, 243, 240, 236),
    scaffoldBackgroundColor: const Color.fromARGB(255, 236, 243, 234),
    dividerColor: const Color.fromARGB(231, 37, 112, 79),
    focusColor: const Color.fromARGB(224, 37, 38, 39),
    splashColor: const Color.fromARGB(224, 37, 38, 39),
    cardColor: const Color.fromARGB(255, 145, 151, 174),
    highlightColor: const Color.fromARGB(255, 108, 145, 194),
    // cardColor: const Color.fromARGB(255, 240, 45, 58),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
      ),
      titleMedium: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      titleLarge: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 25,
        ),
      ),
      headlineLarge: GoogleFonts.russoOne(
        color: Colors.black,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 25,
          color: Colors.black,
        ),
      ),
      headlineSmall: GoogleFonts.outfit(
        color: const Color.fromARGB(255, 37, 38, 39),
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color: const Color.fromARGB(255, 37, 38, 39),
        ),
      ),
      headlineMedium: GoogleFonts.outfit(
        color: const Color.fromARGB(255, 37, 38, 39),
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color: const Color.fromARGB(255, 37, 38, 39),
        ),
      ),
      displayLarge: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),
      ),
      displayMedium: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),
      ),
      displaySmall: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),
      ),
      bodyMedium: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12,
        ),
      ),
      bodySmall: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 10,
        ),
      ),
      bodyLarge: GoogleFonts.outfit(
        color: Colors.black,
        textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 145, 151, 174),
    ),
  );

  static ThemeData dark = ThemeData(
    applyElevationOverlayColor: false,
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: const MaterialColor(
      0xFFE0E0E0, // Set the primary color to white
      <int, Color>{
        50: Color(0xFFFAFAFA),
        100: Color(0xFFF5F5F5),
        200: Color(0xFFEAEAEA),
        300: Color(0xFFE0E0E0),
        400: Color(0xFFD6D6D6),
        500: Color(0xFFCCCCCC),
        600: Color(0xFFC2C2C2),
        700: Color(0xFFB8B8B8),
        800: Color(0xFFADADAD),
        900: Color(0xFFA3A3A3),
      },
    ),
    primaryColorLight: const Color.fromARGB(223, 48, 56, 74),
    primaryColorDark: const Color.fromARGB(255, 131, 130, 128),
    canvasColor: const Color.fromARGB(255, 243, 240, 236),
    scaffoldBackgroundColor: const Color.fromARGB(224, 39, 48, 67),
    dividerColor: const Color.fromARGB(231, 4, 4, 4),
    focusColor: const Color.fromARGB(255, 255, 249, 251),
    splashColor: const Color.fromARGB(224, 37, 38, 39),
    cardColor: const Color.fromARGB(255, 145, 151, 174),
    highlightColor: const Color.fromARGB(255, 108, 145, 194),
    // cardColor: const Color.fromARGB(255, 240, 45, 58),
    // textTheme: TextTheme(
    // titleSmall: GoogleFonts.outfit(
    //     color: const Color.fromARGB(255, 39, 48, 67),
    //     textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    //     titleMedium: GoogleFonts.outfit(
    //       color: const Color.fromARGB(255, 145, 151, 174),
    //     ),
    //     titleLarge: GoogleFonts.russoOne(
    //       color: const Color.fromARGB(255, 243, 240, 236),
    //       textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 25.r),
    //     ),
    //     bodyLarge: GoogleFonts.russoOne(
    //       color: const Color.fromARGB(255, 243, 240, 236),
    //       textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 25.r),
    //     ),
    //     labelLarge: GoogleFonts.outfit(
    //       color: const Color.fromARGB(255, 243, 240, 236),
    //       textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14.r),
    //     ),
    //     bodySmall: GoogleFonts.outfit(
    //       color: const Color.fromARGB(255, 145, 151, 174),
    //       textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12.r),
    //     ),
    //     displayLarge: GoogleFonts.outfit(
    //       color: Colors.black,
    //       textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16.r),
    //     )),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 145, 151, 174),
    ),
  );
}
