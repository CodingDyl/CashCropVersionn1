import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../Home/homepage.dart';
import '../../constants/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
          child: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF0EAE30),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text("Cart",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    margin: EdgeInsets.only(left: size.width * 0.1),
                    child: const Center(
                      child: Image(
                        image: AssetImage(
                            "img_assets/cart_bruv-removebg-preview.png"),
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Cart is Empty",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Seems like your cart is empty",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6))),
                      Text("Lets change that!",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  height: 60,
                  width: size.width * 0.8,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF0EAE30),
                  ),
                  child: const Center(
                      child: Text("Go Shopping",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.15,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text("Total",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0, top: 20.0),
                          child: Text(
                            "R0.00",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.checkoutDetails),
                        child: Container(
                          height: 50,
                          width: size.width * 0.9,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                          ),
                          child: const Center(
                              child: Text("Checkout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
