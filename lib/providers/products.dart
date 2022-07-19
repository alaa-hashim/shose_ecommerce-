import 'package:flutter/material.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<List<Product>> fetchAlbum() async {
    var url = Uri.parse('http://10.39.1.110/alaa/product.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Welcome.fromJson(jsonDecode(response.body));
      var jsonData = jsonDecode(response.body);
      List<Product> welcome = [];

      for (var v in jsonData) {
        Product w1 = Product(
          catId: v['cat_id'],
          id: v['id'],
          name: v['name'],
          image: v['image'],
          price: double.parse(v['price']),
          description: v['description'],
        );

        welcome.add(w1);
        _items = welcome.reversed.toList();
        notifyListeners();
      }
      return welcome;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<Product>> fetchproduct() async {
    var url = Uri.parse('http://10.39.1.115/alaa/product.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Welcome.fromJson(jsonDecode(response.body));
      var jsonData = jsonDecode(response.body);
      List<Product> welcome = [];

      for (var v in jsonData) {
        Product w1 = Product(
          catId: v['cat_id'],
          id: v['id'],
          name: v['name'],
          image: v['image'],
          price: double.parse(v['price']),
          description: v['description'],
        );

        welcome.add(w1);
        _items = welcome;
        notifyListeners();
      }
      return welcome;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
