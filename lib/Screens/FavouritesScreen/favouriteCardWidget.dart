import 'package:cash_crop_version1/constants/favouriteController.dart';
import 'package:cash_crop_version1/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({Key? key}) : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  final FavouriteController fav = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              "img_assets/tomato.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tomatoes",
                style: ThemeText.cardTitleText,
              ),
              Row(
                children: const [
                  Text(
                    "R27.50",
                    style: ThemeText.cardText,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "/kg",
                    style: ThemeText.cardSubtitleText,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primaryGreen,
            ),
            onPressed: () {
              setState(() {
                fav.decrease();
              });
            },
          ),
        ],
      ),
    );
  }
}
