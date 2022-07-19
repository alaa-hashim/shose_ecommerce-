// ignore_for_file: prefer_const_literals_to_create_immutabl, unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:shoes_commerce_app/Screens/Detailspage.dart';
import 'package:shoes_commerce_app/Widgets/product_item.dart';
import 'package:shoes_commerce_app/providers/products.dart';

class Pscreen extends StatefulWidget {
  const Pscreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Pscreen> createState() => _PscreenState();
}

class _PscreenState extends State<Pscreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context, listen: false).fetchAlbum();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final products = productsData.items;
    return FutureBuilder(
        future: Provider.of<Products>(context, listen: false).fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: products[index], child: Pitem());
              });
        });
  }
}
