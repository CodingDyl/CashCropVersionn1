import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/routes.dart';

//import '../Home/homepage.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.homeScreenRoute),
          child: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF0EAE30),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text("My Orders",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 40,
                  width: 120,
                  margin: const EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF0EAE30),
                  ),
                  child: const Center(
                    child: Text(
                      "Completed",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 120,
                margin: const EdgeInsets.only(right: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text("Placed",
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.6))),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  buildOrders(size),
                  buildOrders(size),
                  buildOrders(size),
                  buildOrders(size),
                  buildOrders(size),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildOrders(Size size) {
    return Container(
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: size.height * 0.18,
              width: size.width * 0.3,
              padding: EdgeInsets.zero,
              child: const Image(
                image: AssetImage("img_assets/tomato.jpeg"),
                fit: BoxFit.fill,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tomatoes",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Row(
                children: [
                  const Text(
                    "R27.98",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text("1 kg",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.3)))
                ],
              ),
              Text("Ref#",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.3))),
              const Text("CASHCROP#0303948",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              Text("Schedule",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.3))),
              const Text("26 July | 11:00 AM to 12:30 PM",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
