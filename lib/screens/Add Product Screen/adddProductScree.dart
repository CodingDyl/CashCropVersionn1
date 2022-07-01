import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import '../../constants/theme.dart';
import '../widgets/user_image_picker.dart';

class AddProductScreen2 extends StatefulWidget {
  AddProductScreen2({Key? key}) : super(key: key);

  @override
  State<AddProductScreen2> createState() => _AddProductScreen2State();
}

class _AddProductScreen2State extends State<AddProductScreen2> {
  final _titleController1 = TextEditingController();
  final _descriptionController1 = TextEditingController();
  final _categoryController1 = TextEditingController();
  final _priceController1 = TextEditingController();
  final _measurementController1 = TextEditingController();
  final _locationController1 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  User user = FirebaseAuth.instance.currentUser!;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadProductToFirebase() async {
    final path = 'Users/${user.uid.toString()}/products/${pickedFile!.name}';
    print('HERE IS THE PATH IN FIREBASE: ' + path);
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      setState(() {
        uploadTask = ref.putFile(file);
      });
    } on FirebaseException catch (e) {
      print('PROBLEM IS UPLOADING IT');
      print(e.message);
    }

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('HERE IS THE IMAGE DOWNLOAD LINK: $urlDownload');

    setState(() {
      uploadTask = null;
    });
    final productsRef =
        await FirebaseFirestore.instance.collection('Products').doc();
    final newId = productsRef.id;

    //Add product to the products table

    productsRef.set({
      'id': newId,
      'imageUrl': urlDownload,
      'title': _titleController1.text.trim(),
      'description': _descriptionController1.text.trim(),
      'category': _categoryController1.text.trim(),
      'price': _priceController1.text.trim(),
      'measurement': _measurementController1.text.trim(),
      'location': _locationController1.text.trim(),
    });

    //Add product to the specific users product table
    await FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
      'products': FieldValue.arrayUnion(
        [
          {
            'id': newId,
            'imageUrl': urlDownload,
            'title': _titleController1.text.trim(),
            'description': _descriptionController1.text.trim(),
            'category': _categoryController1.text.trim(),
            'price': _priceController1.text.trim(),
            'measurement': _measurementController1.text.trim(),
            'location': _locationController1.text.trim(),
          },
        ],
      ),
    });
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 30,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                    value: progress, backgroundColor: AppColors.primaryGreen),
                Center(
                  child: Text(
                    "${(100 * progress).roundToDouble()}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(height: 10);
        }
      });

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

  @override
  Widget build(BuildContext context) {
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
          child: Text("Post Add 2 b", style: ThemeText.appBarTitle),
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
                    //UPLOAD FUNCTION HERE
                    uploadProductToFirebase();
                  },
                  child: Container(
                    // height: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                          Text("Post Add", style: ThemeText.postTitleTextWhite),
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
        child: Form(
          key: formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProgress(),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    // image: DecorationImage(image: _pickImage != null? FileImage(_pickImage): null),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        // spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]),
                child: pickedFile != null
                    ? Center(
                        child: Image.file(
                          File(pickedFile!.path!),
                        ),
                      )
                    : Container(
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Align(
                                alignment: Alignment.center,
                                child: Text("Add a photo",
                                    textAlign: TextAlign.center,
                                    style: ThemeText.cardText)),
                            IconButton(
                              icon: const Icon(
                                Icons.add_photo_alternate_rounded,
                                color: AppColors.iconColor,
                                size: 32,
                              ),
                              onPressed: selectFile,
                            ),
                          ],
                        )),
              ),
              if (pickedFile != null)
                const Text("Add a photo", style: ThemeText.cardText),
              if (pickedFile != null)
                IconButton(
                  icon: const Icon(
                    Icons.photo_camera_outlined,
                    color: AppColors.iconColor,
                    size: 32,
                  ),
                  onPressed: selectFile,
                ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.9,
                // height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Title", style: ThemeText.postTitleText),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _titleController1,
                          autocorrect: true,
                          style: const TextStyle(color: AppColors.primaryGreen),
                          decoration: InputDecoration(
                            hintText: "Enter in title for product...",
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
                      ),
                    ),
                  ],
                ),
              ),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.9,
                // height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Category", style: ThemeText.postTitleText),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _categoryController1,
                          autocorrect: true,
                          style: const TextStyle(color: AppColors.primaryGreen),
                          decoration: InputDecoration(
                            hintText: "Select category type...",
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
                      ),
                    ),
                  ],
                ),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.9,
                // height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Location", style: ThemeText.postTitleText),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _locationController1,
                          autocorrect: true,
                          style: const TextStyle(color: AppColors.primaryGreen),
                          decoration: InputDecoration(
                            hintText: "Location",
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
                      ),
                    ),
                  ],
                ),
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
