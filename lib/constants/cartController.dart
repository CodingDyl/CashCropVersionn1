import 'package:cash_crop_version1/constants/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cartController extends GetxController {
  //variable now has states
  var items = 0.obs;

  incrementItems() {
    items.value++;
    Get.snackbar(
      "Added To Cart",
      "Item has been added to cart",
      icon: const Icon(Icons.shopping_cart),
      barBlur: 20,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.backgroundColor,
    );
  }

  decreaseItems() {
    items.value--;
  }
}
