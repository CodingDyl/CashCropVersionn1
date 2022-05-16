import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../constants/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.iconColor,
            size: 32,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Settings", style: ThemeText.appBarTitle),
        ),
        centerTitle: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text("General",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 5,
              ),
              SettingBlock(
                setting: "Account",
              ),
              SettingBlock(
                setting: "Notifications",
              ),
              SettingBlock(
                setting: "Manage Posts",
              ),
              SettingBlock(setting: "Logout"),
              SettingBlock(
                setting: "Delete Account",
              ),
              SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Text("Feedback",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 5,
              ),
              SettingBlock(
                setting: "Report a Bug",
              ),
              SettingBlock(
                setting: "Send Feedback",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingBlock extends StatelessWidget {
  SettingBlock({Key? key, this.setting, this.icon}) : super(key: key);

  String? setting;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(setting!,
              style: const TextStyle(fontSize: 16, color: Colors.black26)),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Divider(
        height: 2,
        thickness: 2,
        color: Colors.grey.withOpacity(.55),
      ),
    ]);
  }
}
