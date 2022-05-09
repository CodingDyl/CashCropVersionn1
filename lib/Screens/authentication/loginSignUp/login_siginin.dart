import 'package:cash_crop_version1/constants/routes.dart';
import 'package:cash_crop_version1/screens/authentication/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/top_clipper.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Theme.of(context)
                  .colorScheme
                  .secondary, //color: Theme.of(context).accentColor
            ),
            ClipPath(
              clipper: TopClipper(),
              child: Container(
                width: size.width,
                height: size.height * .6,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              // padding: const EdgeInsets.symmetric(vertical: 50),
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .13,
                  ),
                  Image.asset('assets/images/logo/logo.png', height: 150),
                  Text(
                    'CashCrop',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: size.height * .25),
                  SignupButton(
                    text: 'Login',
                    inverted: true,
                    press: () => Get.toNamed(AppRoutes.loginRoute),
                  ),
                  const SizedBox(height: 40),
                  SignupButton(
                    text: 'Signup',
                    press: () => Get.toNamed(AppRoutes.signupRoute),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
