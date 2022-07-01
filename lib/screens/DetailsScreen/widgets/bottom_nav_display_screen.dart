import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CartScreen/controller/cart_controller.dart';

class BottomNavAddToCart extends StatelessWidget {
  final product;
  const BottomNavAddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final Size size = MediaQuery.of(context).size;
    return Container();
  }
}
