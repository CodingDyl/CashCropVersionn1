import 'package:flutter/material.dart';

import 'constants.dart';

class ThemeText {
  static const TextStyle appBarTitle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black);

  static const TextStyle cardText = TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryGreen,
      fontSize: 16);

  static const TextStyle postTitleText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black);

  static const TextStyle textfieldInput =
      TextStyle(color: AppColors.primaryGreen);

  static const TextStyle postTitleTextWhite =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white);

  static const TextStyle cardTitleText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle cardSubtitleText =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black);
  static TextStyle cardWeightText = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Colors.grey.withOpacity(0.6));
}
