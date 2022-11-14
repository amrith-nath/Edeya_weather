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

  static final TextStyle loginTextStyle = GoogleFonts.manrope(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.black,
    // decoration: TextDecoration.underline,
  );

  static final TextStyle loginSubTextStyle = GoogleFonts.manrope(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    color: Colors.black,
    // decoration: TextDecoration.underline,
  );
  static final TextStyle userHeadTextStyle = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
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

  static final TextStyle userNameStyle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kButtonColor,
  );

  static final TextStyle userEmailStyle = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: kgreytextColor,
  );

  static final TextStyle onboardTitleStyle = GoogleFonts.robotoCondensed(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: kBlack,
    letterSpacing: 1,
  );

  static final TextStyle onboardSubTitleStyle = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: kBlack.withOpacity(0.7),
    letterSpacing: 1,
  );
}
