import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color zBrown = Color(0xff292526);
const Color zDarkBrown = Color(0xff1B2028);

const Color zGrey = Color(0xffA4AAAD);
const Color zDarkGrey = Color(0xff878787);
const Color zLightGrey = Color(0xffededed);

const Color zWhite = Color(0xffffffff);
const Color zBlack = Color(0xff111111);

const Color zYellow = Color(0xffffd33c);

const double zBorderRadius = 12.0;

const double zPaddingHorizontal = 24.0;

final zInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(zBorderRadius),
  borderSide: const BorderSide( color: zLightGrey),
);

final zEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700,
);
final zEncodeSansSemiBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600,
);

final zEncodeSansMedium = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500,
);

final zEncodeSansNormal = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400,
);


