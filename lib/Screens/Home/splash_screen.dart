import 'dart:async';

import 'package:cash_crop_version1/Screens/authentication/loginSignUp/login_siginin.dart';
//import 'package:cash_crop_version1/screens/Home/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import '../../constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //Get.toNamed(AppRoutes.loginRoute);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginSigninScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: size.height * 0.4),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF0EAE30),
          Color(0xFFC8F347),
        ])),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipOval(
                  child: Image(
                    image: AssetImage("img_assets/CashCrop.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
