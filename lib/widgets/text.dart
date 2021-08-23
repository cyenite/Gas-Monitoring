import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(var text,
    {var fontSize = 18.0,
    textColor = const Color(0XFF9D9D9D),
    var fontFamily = 'Regular',
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5,
    var decoration = TextDecoration.underline,
    var islongTxt = false}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: islongTxt ? null : maxLine,
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}
