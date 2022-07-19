// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product with ChangeNotifier {
  String? id;
  String? catId;
  String? name;
  String? description;
  String? image;
  List? images;
  double? price;
  double? size;
  bool? isFavorite;
  List<Category>? category;
  Product({
    required this.id,
    this.catId,
    required this.name,
    required this.description,
    required this.image,
    this.images,
    required this.price,
    this.size,
    this.isFavorite = false,
    this.category,
  });
  void toggleisFavorite() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }

  Future<Product> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://10.39.1.87/alaa/product.php'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Product.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    catId = json['cat_id'];
    price = json['price'].toDuoble();
    isFavorite = json['isFavorite'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['cat_id'] = catId;
    data['price'] = price;
    data['isFavorite'] = isFavorite;
    data['description'] = description;
    return data;
  }
}

List images = ['1.jpg', '2.jpg', '3.jpg', '4.jpg'];
