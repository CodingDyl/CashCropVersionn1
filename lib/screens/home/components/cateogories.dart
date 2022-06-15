import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

// ignore: camel_case_types
class CategoriesBuilder extends StatelessWidget {
  CategoriesBuilder({Key? key}) : super(key: key);

  final List<Map> category_item = [
    {'title': 'Fruit', 'image': 'assets/images/category food/banaana.png'},
    {'title': 'Vegitable', 'image': 'assets/images/category food/brocoli.png'},
    {'title': 'Meat', 'image': 'assets/images/category food/mea.png'},
    {'title': 'Dairy', 'image': 'assets/images/category food/milk.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: category_item.map<Widget>((e) {
          return CategoryItem(
            title: e['title'],
            image: e['image'],
          );
        }).toList());
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: const Color(0xFFC8F347),
              color: AppColors.primaryGreen,
            ),
            child: Image.asset(image),
          ),
          const SizedBox(height: 10),
          Text(title)
        ],
      ),
    );
  }
}
