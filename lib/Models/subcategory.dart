import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Subcategory with ChangeNotifier {
  String? id;
  String? name;
  String? catId;
  String? image;
  Subcategory({this.id, this.name, this.catId, this.image});
}

class Subcategories with ChangeNotifier {
  List<Subcategory> _items = [];
  List<Subcategory> get items {
    return [..._items];
  }

  Future<List<Subcategory>> getsub() async {
    var url = Uri.parse('http://10.39.1.110/alaa/subcategory.php');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Subcategory> alaa = [];
      for (var a in jsonData) {
        Subcategory h = Subcategory(
          id: a['id'],
          name: a['name'],
          image: a['image'],
          catId: a['cat_id'],
        );
        alaa.add(h);
        _items = alaa;
        notifyListeners();
      }
      return alaa;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
