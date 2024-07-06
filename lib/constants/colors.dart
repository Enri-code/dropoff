import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF4BFE2B);

  static const lightSecondaryColor = Color(0xFFFF0000);
  static const darkSecondaryColor = Color(0xFFFF0000);

  static const lightBackgroundColor = Colors.white;
  static const darkBackgroundColor = Colors.black;

  // static const kGreyColor = Color(0xFFD9D5D5);
  static final kGreyColor = Colors.grey.withOpacity(0.3);
  static const kDarkGreyColor = Color(0xFF8A96A3);

  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue, Colors.red],
  );
}
