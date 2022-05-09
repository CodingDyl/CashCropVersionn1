import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchbarBuild extends StatelessWidget {
  const searchbarBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: Color(0xFF0EAE30),
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          height: 50,
          width: 320,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white),
              ),
              labelText: "Search CashCrop",
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 18,
              ),
              suffixIcon: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
