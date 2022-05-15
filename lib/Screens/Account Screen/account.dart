import 'package:cash_crop_version1/widgets/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';
import '../../widgets/appBar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
          child: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF0EAE30),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text("Account",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: AccountWidget(),
        ),
      ),
    );
  }
}
