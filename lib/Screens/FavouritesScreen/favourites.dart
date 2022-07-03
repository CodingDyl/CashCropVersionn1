import 'package:cash_crop_version1/Screens/FavouritesScreen/favouriteCardWidget.dart';
import 'package:cash_crop_version1/constants/constants.dart';
import 'package:cash_crop_version1/constants/favouriteController.dart';
import 'package:cash_crop_version1/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/food_data.dart';
import '../../constants/routes.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Widget> itemsData = [];
  final FavouriteController fav = Get.put(FavouriteController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.iconColor,
              size: 32,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Favorites", style: ThemeText.appBarTitle),
          ),
          centerTitle: false,
        ),
        body: fav != 0
            ? Container(
                padding: const EdgeInsets.only(top: 20),
                height: size.height,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: const [
                      FavouriteWidget(),
                    ],
                  ),
                ),
              )
            : const CirlceScroll(),
      ),
    );
  }
}

class CirlceScroll extends StatelessWidget {
  const CirlceScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
