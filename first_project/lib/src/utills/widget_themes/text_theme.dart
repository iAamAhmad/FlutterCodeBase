import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JtextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 20,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}
