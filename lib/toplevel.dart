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
                body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return const Scaffold(
                body: Center(child: Text('Something went really wrong bruh')));
          } else if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
