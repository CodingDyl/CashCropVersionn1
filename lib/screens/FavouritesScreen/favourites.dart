import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../constants/food_data.dart';
import '../../constants/routes.dart';
import '../../constants/theme.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Widget> itemsData = [];

  bool isNull = true;

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    for (var post in responseList) {
      listItems.add(Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              post["image"]!,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Text(post["name"]!, style: ThemeText.cardTitleText),
                  const SizedBox(height: 5.0),
                  Text(
                    post["type"]!,
                    style: ThemeText.cardSubtitleText,
                  ),
                  Text(post["farmer"]!, style: ThemeText.cardSubtitleText)
                ]),
                Row(
                  children: [
                    const Text(
                      "R ",
                      style: ThemeText.cardSubtitleText,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: ThemeText.cardSubtitleText,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text("\$ ${post["weight"]}",
                        style: ThemeText.cardWeightText),
                    Text(" kg", style: ThemeText.cardWeightText),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
    }
    setState(() {
      itemsData = listItems;
      isNull = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
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
        body: isNull
            ? const CirlceScroll()
            : Container(
                padding: const EdgeInsets.only(top: 20),
                height: size.height,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      if (itemsData.isNotEmpty) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "No Favorites have been selected...",
                                style: ThemeText.cardTitleText,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: Image.asset(
                                    "img_assets/bart_fav.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Center(
                                child: CircularProgressIndicator(
                                  value: 0.8,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryGreen),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return itemsData[index];
                      }
                    },
                  ),
                ),
              ),
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
