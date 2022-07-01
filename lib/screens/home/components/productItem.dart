import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final DocumentSnapshot product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen, arguments: {'product': product});
      },
      child: Container(
        height: size.height * 0.4,
        width: size.width * 0.44,
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
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Hero(
                  tag: product['id'],
                  child: Image.network(
                    product['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // height: size.height * 0.12,
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        product["title"],
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Icon(Icons.location_on,
                                  size: 18, color: Colors.black26),
                              Text(product['location'],
                                  style:
                                      const TextStyle(color: Colors.black26)),
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
                        Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "R${product['price'].toString()}",
                              style: const TextStyle(
                                color: AppColors.primaryGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "/${product['measurement']}",
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black26),
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
                              color: AppColors.primaryGreen,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
    );
  }
}
