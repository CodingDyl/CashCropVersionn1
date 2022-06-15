import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image.asset(
                "img_assets/farm_boy.jpeg",
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Daniel Mnujzi",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                Text("show profile",
                    style:
                        TextStyle(fontSize: 16, color: AppColors.primaryGreen)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Divider(
          height: 5,
          thickness: 2,
          color: Colors.grey.withOpacity(.55),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Account Information",
                style: TextStyle(color: Colors.black, fontSize: 22),
              )),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 30,
            ),
          )
        ]),
        const SizedBox(height: 20),
        Divider(
          height: 5,
          thickness: 2,
          color: Colors.grey.withOpacity(.55),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Legal",
                style: TextStyle(color: Colors.black, fontSize: 22),
              )),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 30,
            ),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        Divider(
          height: 5,
          thickness: 2,
          color: Colors.grey.withOpacity(.55),
        ),
        const SizedBox(
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.25),
              child: Row(
                children: [
                  Image.asset(
                    "img_assets/CashCrop.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("CashCrop",
                      style: GoogleFonts.cookie(
                          textStyle:
                              TextStyle(fontSize: 42, color: Colors.black))),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Copyright 2022 Marketplaats B.V.",
              style:
                  TextStyle(color: Colors.grey.withOpacity(.55), fontSize: 12),
            ),
            Text(
              "App Version: 1.0.0",
              style:
                  TextStyle(color: Colors.grey.withOpacity(.55), fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
