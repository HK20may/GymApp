import 'package:flutter/material.dart';

class ColorConstants {
  static const Color searchBarBgColor = Color(0xFFE9E9E9);
  static const Color greyBgColor = Color(0xFFEFEFEF);
  static const Color darkGreyBgColor = Color(0xFF1d1d1d);
  static const Color redButtonColor = Color(0xFFb50009);
  static const Color greyButtonColor = Color(0xFF5b5b5b);

  static const int _bluePrimaryValue = 0xFF8694AC;

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF0F2F5),
      300: Color(0xFFE1E4EA),
      400: Color(0xFFC3C9D5),
      500: Color(0xFFA4AFC1),
      600: Color(_bluePrimaryValue),
      700: Color(0xFF536179),
      800: Color(0xFF343D4C),
      900: Color(0xFF1F242D),
    },
  );
}
