import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/routes.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Size size = MediaQuery.of(context).size;

    const siz = 30.0;
    const fsiz = 15.0;
    //bool active = true;
    return Drawer(
      child: Container(
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF0EAE30),
              Color(0xFFC8F347),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const SizedBox(
                height: 100,
                width: 100,
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/images/joji.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              accountName: Text(
                user.displayName.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              accountEmail: Text(user.email.toString()),
              decoration: BoxDecoration(
                color: const Color(0xFF0EAE30).withOpacity(0.6),
                image: DecorationImage(
                  image: const AssetImage(
                    "img_assets/grapes.jpeg",
                  ),
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF0EAE30).withOpacity(0.3),
                      BlendMode.dstATop),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                size: siz,
                color: Color(0xFF50DFB3),
              ),
              title: const Text("Home",
                  style: TextStyle(fontSize: fsiz, color: Color(0xFF50DFB3))),
              onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_border_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Favorite",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.favoriteScreen),
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_alt_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Post an ad",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.postScreen),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Manage my products",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.editScreen),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Orders",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.orderPage),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Cart",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.cartScreen),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.red,
                ),
                child: const Center(
                    child: Text("8",
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Categories",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => print("Cat Tapped"),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Settings",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.settingsScreen),
            ),
            ListTile(
              leading: const Icon(
                Icons.perm_identity_outlined,
                size: siz,
                color: Colors.white,
              ),
              title: const Text("Account",
                  style: TextStyle(fontSize: fsiz, color: Colors.white)),
              onTap: () => Get.toNamed(AppRoutes.accountScreen),
            ),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.exit_to_app_outlined,
                  size: siz,
                  color: Colors.white,
                ),
                title: const Text("Log Out",
                    style: TextStyle(fontSize: fsiz, color: Colors.white)),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAllNamed(AppRoutes.loginRoute);
                  // Navigator.of(context).pushReplacement(
                  // MaterialPageRoute(builder: (_) => const LoginSigninScreen())),
                }),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/images/logo/logo.png"),
                  ),
                  Text("CashCrop",
                      style: GoogleFonts.cookie().copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
