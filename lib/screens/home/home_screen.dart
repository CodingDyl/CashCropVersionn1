import 'package:cash_crop/providers/product.dart';
import 'package:cash_crop/screens/home/components/navbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import 'components/cateogories.dart';
import 'components/coupon.dart';
import 'components/productItem.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  Stream<List<Product>> readProducts() => FirebaseFirestore.instance
      .collection('Products')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {

    //Get device width and height
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        //Menu drawer
        drawer: const  NavBarDrawer(),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: AppColors.primaryGreen,
          title: Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                SizedBox(width: size.width * .15),
                Image.asset('assets/images/logo/logo.png', height: 50),
                Text(
                  'CashCrop',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.cartScreen);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: _products.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: Text('Something has gone terribly wrong broo!'));
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  mainAxisExtent: size.height * .4),

                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return ProductItem(
                              product: documentSnapshot,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
