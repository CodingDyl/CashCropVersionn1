import 'package:cash_crop/constants/constants.dart';
import 'package:cash_crop/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/authentication/Login/login_screen.dart';

class TopLevel extends StatefulWidget {
  const TopLevel({Key? key}) : super(key: key);

  @override
  State<TopLevel> createState() => _TopLevelState();
}

class _TopLevelState extends State<TopLevel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                backgroundColor: AppColors.primaryGreen, body: SplashWait());
          } else if (snapshot.hasError) {
            return const Scaffold(
                backgroundColor: AppColors.primaryGreen,
                body: ConnectionError());
          } else if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}

class SplashWait extends StatelessWidget {
  const SplashWait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/images/logo/logo.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.wifi_off_outlined,
            color: AppColors.iconColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "There is a connection issue, please make sure you conected to the internet"),
        ],
      ),
    );
  }
}
