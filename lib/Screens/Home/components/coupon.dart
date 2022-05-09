import 'package:flutter/material.dart';

// ignore: camel_case_types
class couponBuilder extends StatelessWidget {
  const couponBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFC8F347),
            ),
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.only(top: 15.0, left: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Get your first",
                            style: TextStyle(fontSize: 22)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Flexible(
                              child: Text("order up to ",
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Text("60%",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 40,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text("REFCROP2022",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.60,
          top: 3,
          bottom: 3,
          child: const Image(
              height: 180,
              width: 180,
              image: AssetImage("img_assets/couponbg.png")),
        ),
      ],
    );
  }
}
