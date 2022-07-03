import 'package:cash_crop_version1/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class itemsController extends GetxController {
  var amount = 1.obs;

  increment() {
    amount.value++;
  }

  decrease() {
    if (amount.value == 1) {
      Get.snackbar(
        "Error",
        "Items can not be less than one",
        icon: const Icon(
          Icons.alarm,
          color: Colors.white,
        ),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.primaryGreen,
        colorText: Colors.white,
      );
    } else {
      amount.value--;
    }
  }
}
