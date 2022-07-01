import 'package:cash_crop/screens/Account%20Screen/account.dart';
import 'package:cash_crop/screens/Post%20Screen/widgets/uploadImage.dart';
import 'package:cash_crop/src/settings/settings_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';
import 'screens/FavouritesScreen/favourites.dart';
import 'screens/Settings/settingsScreen.dart';
import 'screens/home/home_screen.dart';
// import 'components/cateogories.dart';
// import 'components/coupon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final screens = [
    HomeScreen(),
    ImageUploads(),
    const AccountPage(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: screens[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(35)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF0EAE30),
            unselectedItemColor: Colors.grey,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
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
            // Get.toNamed(AppRoutes.postScreen);
            Get.toNamed(AppRoutes.addProductScreen2);
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xFF0EAE30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
