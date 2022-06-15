import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

// ignore: camel_case_types
class CouponBuilder extends StatelessWidget {
  const CouponBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: size.height * .19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: const Color(0xFFC8F347),
              color: AppColors.secondaryLime,
            ),
            child: Container(
              // width: size.width * .4,
              // margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .4,
                    child: RichText(
                      softWrap: true,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Get ',
                          ),
                          TextSpan(
                            text: ' 30% ',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'off your first order!',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
          Positioned(
            right: -size.width * .05,
            top: -size.height * .02,
            child: Image.asset(
              "assets/images/category food/vegetables basket.png",
              height: size.height * .21,
            ),
          ),
        ],
      ),
    );
  }
}
