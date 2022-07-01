import 'package:cash_crop/screens/CartScreen/controller/cart_controller.dart';
import 'package:cash_crop/screens/DetailsScreen/widgets/bottom_nav_display_screen.dart';
import 'package:cash_crop/screens/DetailsScreen/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';
import '../../providers/product.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.put(CartController(), permanent: true, tag: 'cartController1');
    final product = Get.arguments['product'];
    final Size size = MediaQuery.of(context).size;

    var cartNumber = 1;
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
                    tag: product['id'],
                    child: Image.network(
                      product['imageUrl'],
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        product['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
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
                          product['location'],
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
                        Text(
                          "$cartNumber",
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                      'Description',
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
                      product['description'],
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Arial',
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            // Container(
            //   margin: const EdgeInsets.only(top: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         padding: const EdgeInsets.only(left: 20.0),
            //         child: const Text(
            //           "About this seller",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       SizedBox(
            //         // height: size.height * 0.12,
            //         width: size.width,
            //         child: Container(
            //           margin: const EdgeInsets.symmetric(horizontal: 20.0),
            //           padding: const EdgeInsets.all(10.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(12),
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black.withOpacity(0.3),
            //                 spreadRadius: 1,
            //                 blurRadius: 3,
            //               ),
            //             ],
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               const CircleAvatar(
            //                 radius: 40,
            //                 backgroundImage:
            //                     AssetImage("img_assets/farm_boy.jpeg"),
            //               ),
            //               const SizedBox(width: 10),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const Text(
            //                     "Daniel Mnjuzi",
            //                     style: TextStyle(
            //                         fontSize: 18, fontWeight: FontWeight.bold),
            //                   ),
            //                   Text("48 Ads",
            //                       style: TextStyle(
            //                           color: Colors.black.withOpacity(0.3))),
            //                   Row(
            //                     children: [
            //                       Icon(
            //                         Icons.verified,
            //                         color: Colors.black.withOpacity(0.3),
            //                       ),
            //                       Text(
            //                         "Verified",
            //                         style: TextStyle(
            //                             color: Colors.black.withOpacity(0.3)),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 30),
            //     ],
            //   ),
            // ),
          ],
        ),
        bottomNavigationBar: Container(
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
                  const Text("Price",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 214, 210, 210))),
                  Row(
                    children: [
                      Text("R${product['price']}",
                          style: const TextStyle(
                              fontSize: 19, color: Colors.white)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("/${product['measurement']}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 214, 210, 210))),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  cartController.addProduct(product);
                },
                child: Container(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
