import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class GoogleFont {
  static final TextStyle splashStyle = GoogleFonts.manrope(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: Colors.black,
    // decoration: TextDecoration.underline,
  );

  static final TextStyle splashStyleYellow = GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.w600,
    color: kYellow,
  );

  static final TextStyle splashStyleBlue = GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.w600,
    color: kBlue,
  );

  static final TextStyle splashStyleRed = GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.w600,
    color: kRed,
  );

  static final TextStyle splashStyleGreen = GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.w600,
    color: kGreen,
  );

  static final TextStyle splashThinStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: kgreytextColor,
  );

  static final TextStyle onboardTitleStyle = GoogleFonts.robotoCondensed(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: kBlack,
  );

  static final TextStyle onboardSubTitleStyle = GoogleFonts.robotoCondensed(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: kgreytextColor,
  );
}
