import 'package:cash_crop_version1/constants/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var favourite = 0.obs;

  increment() {
    favourite.value++;
    Get.snackbar(
      "Added To Favourites",
      "Item has been added to your favourites screen",
      icon: const Icon(Icons.favorite),
      barBlur: 20,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.backgroundColor,
    );
  }

  decrease() {
    favourite.value--;
  }
}
