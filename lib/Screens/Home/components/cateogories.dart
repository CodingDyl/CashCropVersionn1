import 'package:flutter/material.dart';

// ignore: camel_case_types
class categoriesBuilder extends StatelessWidget {
  const categoriesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF0EAE30) //const Color(0xFF84FF9E),
                  ),
              child: const Center(
                child: Image(image: AssetImage("img_assets/bannas.png")),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Fruits",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF0EAE30)

                  /// Color(0xFF84FF9E),
                  ),
              child: const Center(
                child: Image(image: AssetImage("img_assets/veg_bg.png")),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Vegatables",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF0EAE30)),
              child: const Center(
                child: Image(image: AssetImage("img_assets/meat_bg.png")),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Meat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF0EAE30)),
              child: const Center(
                child:
                    Image(image: AssetImage("img_assets/milky_chance_bg.png")),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Milk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

//class categoriesListView extends StatelessWidget {
  //const categoriesListView({
    //Key? key,
  //}) : super(key: key);

  //@override
  //Widget build(BuildContext context) {
    //return
