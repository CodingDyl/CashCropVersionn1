import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';

class TitleBar extends StatelessWidget {
  TitleBar({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
        child: const Icon(
          Icons.arrow_back,
          size: 32,
          color: Color(0xFF0EAE30),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Text(title!,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      centerTitle: false,
    );
  }
}
