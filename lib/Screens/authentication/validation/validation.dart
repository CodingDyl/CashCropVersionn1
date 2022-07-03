import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../widgets/signup_button.dart';
import 'package:http/http.dart' as http;

class LoginSignupForm extends StatefulWidget {
  const LoginSignupForm({Key? key}) : super(key: key);

  @override
  State<LoginSignupForm> createState() => _LoginSignupFormState();
}

class _LoginSignupFormState extends State<LoginSignupForm> {
  @override
  Widget build(BuildContext context) {
    final isSignupRoute = Get.currentRoute == AppRoutes.signupRoute;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: isSignupRoute ? size.height * .61 : size.height * .45,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        child: Column(
          children: [
            if (isSignupRoute)
              TextFormField(
                // controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                ),
                keyboardType: TextInputType.name,
              ),
            if (isSignupRoute) const SizedBox(height: 20),
            TextFormField(
              // controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFormField(
              // controller: passwordController,
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
            if (isSignupRoute) const SizedBox(height: 20),
            if (isSignupRoute)
              TextFormField(
                // controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  // suffixIcon: const Icon(Icons.red_eye)
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            const SizedBox(height: 40),
            SignupButton(
              text: isSignupRoute ? 'Signup' : 'Login',
              press: () {
                if (isSignupRoute) Get.toNamed(AppRoutes.verifyEmailRoute);
                if (!isSignupRoute) Get.toNamed(AppRoutes.homeScreenRoute);
                // GetUtils.isEmail(emailController.text);
              },
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                if (isSignupRoute) Get.offAndToNamed(AppRoutes.loginRoute);
                if (Get.currentRoute == AppRoutes.loginRoute) {
                  Get.offAndToNamed(AppRoutes.signupRoute);
                }
              },
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: isSignupRoute
                          ? "Don't have an account? "
                          : "Have an account? ",
                      style: const TextStyle(color: AppColors.darkGrey),
                    ),
                    TextSpan(
                      text: isSignupRoute ? 'Login' : 'Signup',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryGreen),
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

Future<void> login() async {}
