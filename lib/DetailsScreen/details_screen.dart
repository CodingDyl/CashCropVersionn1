//import 'package:cash_crop_version1/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.45,
                  width: size.width,
                  child: const Image(
                    image: AssetImage("img_assets/tomato.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 45,
                  right: 20,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.homeScreenRoute);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: size.height * 0.05,
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ]),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFF0EAE30),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: size.height * 0.05,
                                  width: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: const Center(
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Color(0xFF0EAE30),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: size.height * 0.05,
                                  width: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: const Center(
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Color(0xFF0EAE30),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tomatoes",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        Text(
                          "Edenglen",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
                      ),
                      const Icon(
                        Icons.star_border_outlined,
                        size: 35,
                      ),
                      Text("(4.4)",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Center(child: Icon(Icons.remove)),
                        ),
                        const Text(
                          "1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          color: const Color(0xFF0EAE30),
                          child: const Center(
                              child: Icon(Icons.add, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Ideal for slicing dicing, grilling, frying or fresh in salads",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Arial',
                            color: Colors.black.withOpacity(0.8)),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "About this seller",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                    width: size.width,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("img_assets/farm_boy.jpeg"),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Daniel Mnjuzi",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("48 Ads",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.3))),
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  Text(
                                    "Verified",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.3)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.12,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Color(0xFF0EAE30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.7))),
                            Row(
                              children: [
                                const Text("R27.50",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("/kg",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.7))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: size.width * 0.5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Add to cart",
                                  style: TextStyle(
                                      color: Color(0xFF0EAE30), fontSize: 20)),
                              Icon(
                                Icons.add_shopping_cart,
                                color: Color(0xFF0EAE30),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
