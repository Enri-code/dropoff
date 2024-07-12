import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF41D128);

  static const lightSecondaryColor = Color(0xFFFF0000);
  static const darkSecondaryColor = Color(0xFFFF0000);

  static const lightBackgroundColor = Colors.white;
  static const darkBackgroundColor = Colors.black;

  // static const kGreyColor = Color(0xFFD9D5D5);
  static final kGreyColor = Colors.grey.withOpacity(0.3);
  static const kDarkBackround = Color(0xFF1E1E1E);

  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue, Colors.red],
  );
}
