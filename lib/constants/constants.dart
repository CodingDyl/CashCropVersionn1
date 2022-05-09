import 'package:flutter/material.dart';

class AppColors {
  static const primaryGreen = Color(0xff0EAE30);
  static const secondaryLime = Color(0xffC8F347);
  static const lightGrey = Color(0xffF2F2F2);
  static const darkGrey = Color(0xffA0A0A0);
  static const backgroundColor = Color(0xFFF2F2F2);
  static const iconColor = Color(0xFF0EAE30);
}

final otpInputDecoration = InputDecoration(
  // contentPadding:
  //     EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
  focusColor: AppColors.primaryGreen,
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: AppColors.primaryGreen,
    ),
  );
}
