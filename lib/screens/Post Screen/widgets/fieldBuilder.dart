import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/theme.dart';

class FieldBuilder extends StatelessWidget {
  const FieldBuilder(
      {Key? key,
      required this.hinttext,
      required this.titleText,
      required this.controller})
      : super(key: key);

  final String titleText;
  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: size.width * 0.9,
      // height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(titleText, style: ThemeText.postTitleText),
          ),
          Center(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                controller: controller,
                autocorrect: true,
                style: const TextStyle(color: AppColors.primaryGreen),
                decoration: InputDecoration(
                  hintText: hinttext,
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
    );
  }
}
