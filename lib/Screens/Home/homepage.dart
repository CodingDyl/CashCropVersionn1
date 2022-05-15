//import 'package:cash_crop_version1/CartScreen/cartscreen.dart';
//import 'package:cash_crop_version1/Screens/PostScreen/post_screen.dart';
import 'package:cash_crop_version1/screens/Home/components/coupon.dart';
import 'package:cash_crop_version1/screens/Home/components/jobcard.dart';
import 'package:cash_crop_version1/screens/Home/components/search.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/routes.dart';
import 'components/cateogories.dart';
import 'navbar_widget.dart';
//import 'package:cash_crop_version1/src/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0EAE30),
        elevation: 0,
        centerTitle: true,
        //leading: Container(
        //padding: const EdgeInsets.only(left: 30),
        //child: const Icon(Icons.menu)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
                image: AssetImage("img_assets/CashCrop.png"),
                height: 30,
                width: 30),
            Text("CashCrop",
                style: GoogleFonts.cookie()
                    .copyWith(fontSize: 32, color: Colors.white)),
          ],
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.cartScreen),
            child: const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.shopping_bag),
            ),
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  searchbarBuild(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const couponBuilder(),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Categories",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: size.height * 0.15,
              margin: const EdgeInsets.only(left: 30),
              child: const categoriesBuilder(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5),
              child: Text("Today",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Container(
              height: size.height * 0.27,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(left: 30),
              child: const cardBuilder(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0EAE30),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.postScreen);
        },
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF0EAE30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
