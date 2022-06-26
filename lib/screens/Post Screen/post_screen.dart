import 'dart:io';

import 'package:cash_crop/providers/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import '../../constants/theme.dart';
import '../widgets/user_image_picker.dart';
import 'widgets/fieldBuilder.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _measurementController = TextEditingController();
  final _locationController = TextEditingController();
  XFile? _userImage;
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _measurementController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _pickedImage(XFile image) {
    setState(() {
      _userImage = image;
    });
  }

  Future addProduct() async {
    //validate
    // FirebaseAuth.instance.currentUser!
    final docUser = FirebaseFirestore.instance.collection('Products').doc();

    // Upload imagae to firebase storage
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(docUser.id + '.jpg');
    try {
      await ref.putFile(File(_userImage!.path));
    } on FirebaseException catch (e) {
      print('HERE IS THE PROBLEM!!! $e');
    }

    final url = await ref.getDownloadURL();

    print('HERE IS THE URL HERE!!!! : $url');

    final product = Product(
        id: docUser.id,
        title: _titleController.text,
        description: _descriptionController.text,
        category: _categoryController.text,
        price: int.parse(_priceController.text),
        imageUrl: url,
        location: _locationController.text,
        measurement: _measurementController.text);

    final json = product.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.iconColor,
              size: 32,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Post Ad", style: ThemeText.appBarTitle),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: size.width,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // height: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.backgroundColor,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Cancel", style: ThemeText.postTitleText),
                          Icon(Icons.cancel_outlined, size: 18)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addProduct();
                    },
                    child: Container(
                      // height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: size.width * 0.4,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: AppColors.primaryGreen,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Post Add",
                                style: ThemeText.postTitleTextWhite),
                            Icon(
                              Icons.photo_camera_outlined,
                              size: 18,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "CashCrop's Terms of Use and Privacy Notice apply",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              UserImagePicker(
                imagePickedFn: (XFile? image) => _pickedImage,
              ),
              const SizedBox(height: 10),
              FieldBuilder(
                  titleText: "Title",
                  hinttext: "Enter in title for product...",
                  controller: _titleController),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child:
                          Text("Description", style: ThemeText.postTitleText),
                    ),
                    TextField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 4,
                      style: const TextStyle(color: AppColors.primaryGreen),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryGreen, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FieldBuilder(
                titleText: "Category",
                hinttext: "Select category type...",
                controller: _categoryController,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child:
                                Text("Price", style: ThemeText.postTitleText),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _priceController,
                              style: ThemeText.textfieldInput,
                              decoration: InputDecoration(
                                prefixText: "R ",
                                prefixStyle: ThemeText.postTitleText,
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryGreen,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("Measurement",
                                style: ThemeText.postTitleText),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _measurementController,
                              style: ThemeText.textfieldInput,
                              decoration: InputDecoration(
                                prefixText: "/ ",
                                prefixStyle: ThemeText.postTitleText,
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryGreen,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FieldBuilder(
                hinttext: "Location",
                titleText: "Location",
                controller: _locationController,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
