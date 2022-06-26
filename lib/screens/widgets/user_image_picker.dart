import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import '../../constants/theme.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    Key? key,
    required this.imagePickedFn,
  }) : super(key: key);

  final void Function(XFile? image) imagePickedFn;
  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _image;
  void _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = XFile(image.path);
      setState(() {
        this._image = imageTemp;
      });
      widget.imagePickedFn(_image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.3,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
          child: _image != null
              ? Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                )
              : GestureDetector(
                  onTap: _pickImage,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo_camera_outlined,
                          color: AppColors.iconColor,
                          size: 32,
                        ),
                        Text("Add a photo", style: ThemeText.cardText),
                      ],
                    ),
                  ),
                ),
        ),
        if (_image != null)
          IconButton(
            icon: const Icon(
              Icons.photo_camera_outlined,
              color: AppColors.iconColor,
              size: 32,
            ),
            onPressed: _pickImage,
          ),
        if (_image != null) const Text("Add a photo", style: ThemeText.cardText)
      ],
    );
  }
}
