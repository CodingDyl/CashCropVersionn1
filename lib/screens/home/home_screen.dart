import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';
import 'components/cateogories.dart';
import 'components/coupon.dart';
import 'components/productItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(user.email!),
              Container(
                height: 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Color(0xFF0EAE30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Image.asset('assets/images/logo/logo.png'),
                              Text(
                                'CashCrop',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        color: Colors.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.cartScreen);
                          },
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 40,
                      width: size.width * .7,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          labelText: "Search CashCrop",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const CouponBuilder(),
              const SizedBox(
                height: 20,
              ),

              //Categories section
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // height: size.height * 0.18,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CategoriesBuilder(),
              ),

              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Browse",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Product Items

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: size.height * .4),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
