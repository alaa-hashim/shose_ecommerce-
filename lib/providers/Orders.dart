// ignore_for_file: avoid_types_as_parameter_names, file_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:shoes_commerce_app/providers/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;
  OrderItem(
      {required this.id,
      required this.amount,
      required this.datetime,
      required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  Future<void> fetchOders() async {
    var url = Uri.parse(
        'https://my-app-64f87-default-rtdb.firebaseio.com/oders.json');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        datetime: DateTime.parse(orderData['datetime']),
        products: (orderData['products'] as List<dynamic>)
            .map((item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  name: item['name'],
                  quantity: item['quantity'],
                  image: item['image'],
                ))
            .toList(),
      ));
    });
    _order = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrders(CartItem, cartproduct, double total) async {
    var url = Uri.parse(
        'https://my-app-64f87-default-rtdb.firebaseio.com/oders.json');
    final timeestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'datetime': timeestamp.toIso8601String(),
        'products': cartproduct
            .map((cp) => {
                  'id': cp.id,
                  'name': cp.name,
                  'quantity': cp.quantity,
                  'image': cp.image,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _order.insert(
      0,
      OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          datetime: DateTime.now(),
          products: cartproduct),
    );
    notifyListeners();
  }
}
