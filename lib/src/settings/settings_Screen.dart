import 'package:cash_crop/screens/home/components/productItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../providers/product.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SsettingsStatScreen();
}

class SsettingsStatScreen extends State<SettingScreen> {
  final controller = TextEditingController();

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final product = Product(
        id: docUser.id,
        title: name,
        description: 'sfgsf',
        category: 'Fruits',
        price: 234,
        imageUrl: 'sf',
        location: 'sdfd',
        measurement: 's');
    final json = product.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: controller),
        actions: [
          IconButton(
            onPressed: () {
              final name = controller.text;
              createUser(name: name);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
