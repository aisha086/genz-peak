import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(
    brightness: Brightness.dark,
      fontFamily: GoogleFonts.blackOpsOne().fontFamily,
      colorSchemeSeed: indigoColor,
    cardColor: darkBgColor
  );
  //Colors
  static Color lightBgColor = const Color(0xfffcfbf4);
  static Color darkBgColor =const Color(0xFF111827);
  static Color darkPurpleColor = const Color(0xff403b58);
  static Color indigoColor = const Color(0xFF6366F1);
  static Color lightIndigoColor = const Color(0xFF424482);

}
