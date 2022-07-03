import 'package:cash_crop_version1/constants/cartController.dart';
import 'package:cash_crop_version1/constants/constants.dart';
import 'package:cash_crop_version1/constants/itemController.dart';
import 'package:cash_crop_version1/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../Home/homepage.dart';
import '../../constants/routes.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController c = Get.put(cartController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
      body: c.items != 0 ? const itemCart() : emptyCart(),
    );
  }
}

class itemCart extends StatefulWidget {
  const itemCart({Key? key}) : super(key: key);

  @override
  State<itemCart> createState() => _itemCartState();
}

class _itemCartState extends State<itemCart> {
  final cartController c = Get.put(cartController());
  final itemsController item = Get.put(itemsController());
  var price = 27.50;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            "img_assets/tomato.jpeg",
                            fit: BoxFit.fill,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Text(
                                "/kg",
                                style: ThemeText.cardSubtitleText,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              c.decreaseItems();
                              item.amount.value = 0;
                              if (c.items == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CartScreen()));
                              }
                            }),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: const Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => item.decrease(),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      )),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(() => Text(
                                    "${item.amount.toString()}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () => item.increment(),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryGreen,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.15,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text("Total",
                          style: TextStyle(fontSize: 22, color: Colors.black)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 20.0),
                      child: Obx(
                        () => Text(
                          "R ${(price * item.amount.value).toString()}0",
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
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
                        color: AppColors.primaryGreen,
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
      ],
    );
  }
}

class emptyCart extends StatefulWidget {
  emptyCart({Key? key}) : super(key: key);

  @override
  State<emptyCart> createState() => _emptyCartState();
}

class _emptyCartState extends State<emptyCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
                child: Container(
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
                      onTap: () => Get.snackbar(
                          "Cart is Empty", "Please add some items to the cart",
                          duration: Duration(seconds: 3),
                          barBlur: 20,
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          backgroundColor: AppColors.primaryGreen,
                          colorText: Colors.white),
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
    );
  }
}
