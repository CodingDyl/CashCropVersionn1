import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id;
  final String title;
  final String description;
  final String category;
  final int price;
  final String imageUrl;
  final String location;
  bool isFavorite;
  final String measurement;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.location,
    required this.measurement,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'imageUrl': imageUrl,
        'location': location,
        'measurement': measurement,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      measurement: json['measurement']);

  
}

//void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }
  // Future<void> toggleFavoriteStatus(String token, String userId) async {
  //   final oldStatus = isFavorite;
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  //   final url =
  //       'https://flutter-shop-3006a.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
  //   try {
  //     final response = await http.put(
  //       url,
  //       body: json.encode(
  //         isFavorite,
  //       ),
  //     );
  //     if (response.statusCode >= 400) {
  //       _setFavValue(oldStatus);
  //     }
  //   } catch (error) {
  //     _setFavValue(oldStatus);
  //   }
  // }

