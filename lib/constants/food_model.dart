import 'dart:html';

class FoodModel {
  static List<String> itemTitle = [
    'Tomatoes',
    'Almond Milk',
    'Bannas',
    'Grapes',
    'Grace Cherries',
  ];

  static List<String> itemDesc = [
    'Freshly grown! Grown with Care! Looked after by professionals',
    'Freshly grown! Grown with Care! Looked after by professionals',
    'Freshly grown! Grown with Care! Looked after by professionals',
    'Freshly grown! Grown with Care! Looked after by professionals',
    'Freshly grown! Grown with Care! Looked after by professionals',
  ];

  static List<String> itemImage = [
    'img_assets/tomato.jpeg',
    'img_assets/milky_chance_bg.png',
    'img_assets/bannas.png',
    'img_assets/grapes.jpeg',
    'img_assets/veg_bg.png',
  ];

  static List<String> itemPrice = [
    '27.50',
    '35.20',
    '16.75',
    '10.48',
    '22.56',
  ];

  Item getById(int id) => Item(
        id,
        itemTitle[id % itemTitle.length],
        itemDesc[id % itemDesc.length],
        itemImage[id % itemImage.length],
        itemPrice[id % itemPrice.length],
      );

  Item getPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String image;
  final String price;

  const Item(
    this.id,
    this.name,
    this.desc,
    this.image,
    this.price,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
