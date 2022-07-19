// ignore_for_file: prefer_final_fields
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shoes_commerce_app/Models/product.dart';

class Category with ChangeNotifier {
  String? id;
  String? name;
  String? image;
  List<Product>? products;

  Category({
    this.id,
    this.products,
    required this.name,
    this.image,
  });
}

class Categories with ChangeNotifier {
  List<Category> _items = [];
  List<Category> get items {
    return [..._items];
  }

  Future<List<Category>> fatchcat() async {
    var url = Uri.parse('http://10.39.1.110/alaa/category.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Category> cats = [];
      for (var c in jsonData) {
        Category Q = Category(
          name: c['name'],
          id: c['id'],
          image: c['image'],
        );
        cats.add(Q);
        _items = cats;
        notifyListeners();
      }
      return cats;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  List<Category> get products {
    return [...products];
  }

  Category findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
