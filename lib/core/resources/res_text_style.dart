import 'package:piko/core/resources/res_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResTextStyle {
  static final TextStyle brand = GoogleFonts.walterTurncoat(
    letterSpacing: 0.8,
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: ResColor.darkBlue,
  );

  static final TextStyle fullPageImageCaption = GoogleFonts.roboto(
    letterSpacing: 1,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ResColor.darkBlue,
  );

  static final TextStyle appBarTitle = GoogleFonts.raleway(
    fontSize: 18,
    color: ResColor.darkBlue,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle title = GoogleFonts.raleway(
    fontSize: 21,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle subtitle = GoogleFonts.raleway(fontSize: 12);

  static final TextStyle subscript = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle body = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static final TextStyle whiteTextButton16 = GoogleFonts.raleway(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle sectionTitle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
