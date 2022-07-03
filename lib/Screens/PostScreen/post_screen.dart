import 'package:cash_crop_version1/constants/routes.dart';
import 'package:cash_crop_version1/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.iconColor,
            size: 32,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Post Screen", style: ThemeText.appBarTitle),
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.9,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.photo_camera_outlined,
                          color: AppColors.iconColor,
                          size: 32,
                        ),
                        Text("Add a photo(s)", style: ThemeText.cardText),
                      ]),
                ),
              ),
              fieldBuilder(
                size: size,
                titleText: "Title",
                hinttext: "Enter in title for product...",
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child:
                          Text("Description", style: ThemeText.postTitleText),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 4,
                      style: const TextStyle(color: AppColors.primaryGreen),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryGreen, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fieldBuilder(
                size: size,
                titleText: "Category",
                hinttext: "Select category type...",
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child:
                                Text("Price", style: ThemeText.postTitleText),
                          ),
                          Center(
                            child: TextField(
                              style: ThemeText.textfieldInput,
                              decoration: InputDecoration(
                                prefixText: "R ",
                                prefixStyle: ThemeText.postTitleText,
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryGreen,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("Measurement",
                                style: ThemeText.postTitleText),
                          ),
                          Center(
                            child: TextField(
                              style: ThemeText.textfieldInput,
                              decoration: InputDecoration(
                                prefixText: "/ ",
                                prefixStyle: ThemeText.postTitleText,
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryGreen,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              fieldBuilder(
                  size: size, hinttext: "Location", titleText: "Location"),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.backgroundColor,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Cancel",
                                        style: ThemeText.postTitleText),
                                    Icon(Icons.cancel_outlined, size: 18)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: size.width * 0.4,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                color: AppColors.primaryGreen,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Post Add",
                                        style: ThemeText.postTitleTextWhite),
                                    Icon(
                                      Icons.photo_camera_outlined,
                                      size: 18,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                            "CashCrop's Terms of Use and Privacy Notice apply"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class fieldBuilder extends StatefulWidget {
  const fieldBuilder(
      {Key? key,
      required this.size,
      required this.hinttext,
      required this.titleText})
      : super(key: key);

  final Size size;
  final String titleText;
  final String hinttext;

  @override
  State<fieldBuilder> createState() => _fieldBuilderState();
}

class _fieldBuilderState extends State<fieldBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: widget.size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.titleText, style: ThemeText.postTitleText),
          ),
          Center(
            child: TextField(
              autocorrect: true,
              style: const TextStyle(color: AppColors.primaryGreen),
              decoration: InputDecoration(
                hintText: widget.hinttext,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.primaryGreen, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
