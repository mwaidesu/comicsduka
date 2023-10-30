

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData themeData = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      disabledBackgroundColor: Colors.grey,
    ),
  ),
);
