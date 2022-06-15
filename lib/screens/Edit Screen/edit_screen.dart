import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../constants/edit_posts.dart';
import '../../constants/routes.dart';
import '../../constants/theme.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Text("Manage Posts", style: ThemeText.appBarTitle),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
        child: SingleChildScrollView(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              EditBlock(
                imageUrl: "img_assets/tomato.jpeg",
                name: "Roman Tomatoes",
                price: 69,
              ),
              EditBlock(
                imageUrl: "img_assets/bannas.png",
                name: "Bannas",
                price: 35,
              ),
              EditBlock(
                imageUrl: "img_assets/grapes.jpeg",
                name: "Jasons Grapes",
                price: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
