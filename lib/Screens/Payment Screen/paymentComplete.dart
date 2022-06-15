import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../constants/theme.dart';

class PaymentComplete extends StatelessWidget {
  const PaymentComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: size.height * .3,
                width: size.width * .6,
                decoration: const BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              "Your order has been placed!",
              style: ThemeText.cardTitleText,
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Expected Delivery By",
                  style: ThemeText.cardSubtitleText,
                ),
                Text(
                  "Tomorrow 07:00AM",
                  style: ThemeText.cardSubtitleText,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Back to browse",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.6),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Order Details", style: ThemeText.cardTitleText),
                  const SizedBox(
                    height: 10,
                  ),
                  //insert listview
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Tomatoes",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "Quantity: 1",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "R27.50",
                        style: ThemeText.cardSubtitleText,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black.withOpacity(.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Almond Milk",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "Quantity: 1",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "R35.20",
                        style: ThemeText.cardSubtitleText,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black.withOpacity(.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Bannas",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "Quantity: 1",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "R16.75",
                        style: ThemeText.cardSubtitleText,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black.withOpacity(.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total",
                        style: ThemeText.cardSubtitleText,
                      ),
                      Text(
                        "R108.59",
                        style: ThemeText.cardSubtitleText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
