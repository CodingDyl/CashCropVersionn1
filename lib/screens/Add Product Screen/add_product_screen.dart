import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import '../../constants/theme.dart';
import '../Post Screen/widgets/fieldBuilder.dart';
import '../widgets/user_image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _titleController1 = TextEditingController();
  final _descriptionController1 = TextEditingController();
  final _categoryController1 = TextEditingController();
  final _priceController1 = TextEditingController();
  final _measurementController1 = TextEditingController();
  final _locationController1 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController1.dispose();
    _descriptionController1.dispose();
    _categoryController1.dispose();
    _priceController1.dispose();
    _measurementController1.dispose();
    _locationController1.dispose();
    super.dispose();
  }

  XFile? _uploadImageUser;

  bool isLoading = false;
  void _pickedImage(XFile image) {
    print("THIS IS THE VALUE OF IMAGE : " + image.path);
    setState(() {
      _uploadImageUser = image;
    });
  }

  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;

  _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));
  }

  addProductFirebase() async {
    setState(() {
      isLoading = true;
    });
    print(' HERE IS SOME INFORMSTION HERE ');
    final docUser = FirebaseFirestore.instance.collection('Products').doc();
    Reference reference = storageRef.ref().child('Users');
    UploadTask uploadTask = reference.putFile(File(_uploadImageUser!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(
          ' HERE IS SOME INFORMSTION HERE ${event.bytesTransferred.toString()}');
    });

    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      print('THE IMAGE PATH : $uploadPath');

      // Insert RECORD INTO DATABASE HERE
      if (uploadPath.isNotEmpty) {
        firestoreRef.collection('Products').doc().set({
          "id": docUser.id,
          "title": _titleController1.text,
          "description": _descriptionController1.text,
          "category": _categoryController1.text,
          "price": int.parse(_priceController1.text),
          // "imageUrl": uploadPath,
          "location": _locationController1.text,
          "measurement": _measurementController1.text
        }).then((value) => _showMessage('Record Inserted'));
      } else {
        _showMessage('Ay bruh, something went wrong');
        print('THE IMAGE PATH IS EMPTY');
        setState(() {
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    // final CollectionReference _products =
    //     FirebaseFirestore.instance.collection('Products');

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: Text("Post Addd", style: ThemeText.appBarTitle),
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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
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
                          //UPLOAD FUNCTION HERE
                          addProductFirebase();
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
                controller: _titleController1),
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
                    child: Text("Description", style: ThemeText.postTitleText),
                  ),
                  TextField(
                    controller: _descriptionController1,
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
              controller: _categoryController1,
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
                          child: Text("Price", style: ThemeText.postTitleText),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _priceController1,
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
                            controller: _measurementController1,
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
              controller: _locationController1,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
