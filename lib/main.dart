// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/category.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:shoes_commerce_app/Models/subcategory.dart';
import 'package:shoes_commerce_app/Screens/Detailspage.dart';
import 'package:shoes_commerce_app/Screens/cart-screen.dart';
import 'package:shoes_commerce_app/Screens/navbarscreen.dart';
import 'package:shoes_commerce_app/providers/Orders.dart';
import 'package:shoes_commerce_app/providers/cart.dart';
import 'package:shoes_commerce_app/providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Category(products: [], name: ''),
        ),
        ChangeNotifierProvider.value(
          value: Subcategories(),
        ),
        ChangeNotifierProvider.value(
          value: Product(
              description: '', id: '', image: '', name: '', price: null),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Navr(
          key: null,
        ),
        routes: {
          Details.routeName: (context) => Details(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
