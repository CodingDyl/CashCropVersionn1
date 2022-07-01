import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../providers/user.dart';
import '../../../src/app.dart';

import '../../widgets/signup_button.dart';
import '../../widgets/top_clipper.dart';
import '../utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future signup() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      User updateUser = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(updateUser.uid)
          .set({
        'username': nameController.text.trim(),
        'email': emailController.text.trim(),
      });
      updateUser.updateDisplayName(nameController.text);

      Get.offAllNamed(AppRoutes.mainScreen);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
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
              // padding: const EdgeInsets.only(top: 20),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/logo/logo.png',
                      height: 70,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'CashCrop',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 50),
                    ),
                    const Text(
                      'Create a new account',
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // LoginSignupForm()
                    Container(
                      width: size.width * .9,
                      height: size.height * .62,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Name',
                                prefixIcon: const Icon(Icons.person),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            // if (isSignupRoute) const SizedBox(height: 10),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                            // const SizedBox(height: 10),
                            TextFormField(
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? 'Enter at least 6 characters'
                                      : null,
                            ),
                            // const SizedBox(height: 20),
                            SignupButton(
                              text: 'Signup',
                              press: signup,
                            ),
                            // const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Get.offAndToNamed(AppRoutes.loginRoute);
                              },
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: const TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Have an account? ",
                                      style:
                                          TextStyle(color: AppColors.darkGrey),
                                    ),
                                    TextSpan(
                                      text: 'Login',
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
                      ),
                    )
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
