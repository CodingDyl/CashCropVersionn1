//import 'package:cash_crop_version1/DetailsScreen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes.dart';

// ignore: camel_case_types
class cardBuilder extends StatelessWidget {
  const cardBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: const <Widget>[
        buildList(),
        SizedBox(width: 20),
        buildList(),
        SizedBox(
          width: 20,
        ),
        buildList(),
        SizedBox(
          width: 30,
        ),
        buildList()
      ],
    );
  }
}

// ignore: camel_case_types
class buildList extends StatelessWidget {
  const buildList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen);
      },
      child: Container(
        height: size.height * 0.27,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.15,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("img_assets/tomato.jpeg"),
                ),
              ),
            ),
            Container(
              height: size.height * 0.12,
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Tomatoes",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(Icons.location_on,
                                    size: 20, color: Colors.black26),
                                Text("Glenvista",
                                    style: TextStyle(color: Colors.black26)),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.favorite_border,
                            color: Colors.black.withOpacity(0.6))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "R27.50",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "/kg",
                          style: TextStyle(fontSize: 13, color: Colors.black26),
                        ),
                      ]),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 80,
                          height: 40,
                          margin: const EdgeInsets.only(right: 0),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.green),
                          child: const Center(
                            child: Icon(Icons.add_shopping_cart),
                          ),
                        ),
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
