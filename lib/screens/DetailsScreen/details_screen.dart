import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: ListView(
          children: [
            // Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(''))), child: Row(children: []),),
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .5,
                  child: Hero(
                    tag: "tomato",
                    child: Image.asset(
                      "assets/images/products/tomato.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  right: 20,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          icon: Icons.arrow_back,
                          press: () {
                            Get.back();
                          },
                        ),
                        Positioned(
                          right: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                press: () {},
                                icon: Icons.favorite_border_outlined,
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                press: () {},
                                icon: Icons.shopping_bag_outlined,
                              ),
                            ],
                          ),
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
                  const SizedBox(height: 10),
                  SizedBox(
                    // height: size.height * 0.12,
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavAddToCart(),
      ),
    );
  }
}

class BottomNavAddToCart extends StatelessWidget {
  const BottomNavAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Color(0xFF0EAE30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 214, 210, 210))),
              Row(
                children: [
                  const Text("R27.50",
                      style: TextStyle(fontSize: 19, color: Colors.white)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("/kg",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 214, 210, 210))),
                ],
              ),
            ],
          ),
          Container(
            // margin: const EdgeInsets.all(10.0),
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
                      style: TextStyle(color: Color(0xFF0EAE30), fontSize: 20)),
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
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final Function() press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Center(
          child: Icon(
            icon,
            color: const Color(0xFF0EAE30),
          ),
        ),
      ),
    );
  }
}
