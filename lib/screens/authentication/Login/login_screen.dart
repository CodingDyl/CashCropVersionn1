import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../src/app.dart';

import '../../widgets/signup_button.dart';
import '../../widgets/top_clipper.dart';
import '../utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future logIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Get.offNamed(AppRoutes.mainScreen);
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

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
            color: Theme.of(context).accentColor,
          ),
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              width: size.width,
              height: size.height * .6,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 50),
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/logo/logo.png',
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CashCrop',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 50),
                  ),
                  SizedBox(height: size.height * .02),
                  RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 40),
                        ),
                        TextSpan(
                          text: 'Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .03),
                  const Text(
                    'Login to continue',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(height: size.height * .03),
                  // LoginSignupForm(),
                  Container(
                    width: size.width * .9,
                    height: size.height * .43,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // const SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            // suffixIcon: const Icon(Icons.red_eye)
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),

                        SignupButton(text: 'Login', press: logIn),
                        // const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(AppRoutes.signupRoute);
                          },
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: AppColors.darkGrey),
                                ),
                                TextSpan(
                                  text: 'Signup',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryGreen),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
