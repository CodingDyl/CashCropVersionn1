import 'package:cash_crop/screens/CartScreen/controller/cart_controller.dart';
import 'package:cash_crop/screens/CartScreen/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../Home/homepage.dart';
import '../../constants/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find(tag: 'cartController1');
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
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
      bottomNavigationBar: Container(
        height: size.height * 0.16,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                const Text("Total",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Text(
                  "R ${controller.total}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Container(
                height: 50,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
          ],
        ),
      ),
      body: Obx(
        () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return CartProductCard(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    quantity: controller.products.values.toList()[index],
                    index: index,
                  );
                })),
      ),
    );
  }
}
