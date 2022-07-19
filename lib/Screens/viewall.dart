// ignore_for_file: avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/category.dart';
import 'package:shoes_commerce_app/Widgets/viewallitem.dart';
import 'package:shoes_commerce_app/providers/products.dart';

class viewall extends StatefulWidget {
  static const routeName = '/viewall';
  const viewall({Key? key}) : super(key: key);

  @override
  State<viewall> createState() => _viewallState();
}

class _viewallState extends State<viewall> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context, listen: false).fetchAlbum();
    });
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Categories>(context, listen: false).fatchcat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    final cat = Provider.of<Category>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future:
                  Provider.of<Products>(context, listen: false).fetchAlbum(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('error');
                } else {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 0.65,
                      ),
                      itemCount:
                          // ignore: unrelated_type_equality_checks
                          products.where((e) => e.catId == cat.id).length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: products[index], child: Viewitem());
                      });
                }
              }),
        ),
      ]),
    );
  }
}
