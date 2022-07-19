// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Widgets/catcard.dart';
import 'package:shoes_commerce_app/constants.dart';
import 'package:shoes_commerce_app/providers/products.dart';

class catgepage extends StatefulWidget {
  const catgepage({Key? key}) : super(key: key);

  @override
  State<catgepage> createState() => _catgepageState();
}

class _catgepageState extends State<catgepage> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final products = productsData.items;
    return Scaffold(
      backgroundColor: PKcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Furniture',
            style: TextStyle(color: Color(0xff57636F)),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: const Color(0xff7BCFE9),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                tooltip: 'Open shopping cart',
                color: Colors.white,
                onPressed: () {
                  // handle the press
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: const Color(0xffE4126B),
                  elevation: 4,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffE4126B),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                color: Color(0xff57636F),
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              height: 700,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GridView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const ScrollPhysics(),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 1,
                                                      crossAxisSpacing: 2.2,
                                                      mainAxisSpacing: 5.0,
                                                      childAspectRatio: 2.5,
                                                    ),
                                                    itemCount: products.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ChangeNotifierProvider
                                                          .value(
                                                              value: products[
                                                                  index],
                                                              child: catcard());
                                                    }),
                                              ),
                                            );
                                          });
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 100,
                                            width: 90,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const Text('Sofa'),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 100,
                                          width: 90,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Text('Chiar'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 100,
                                          width: 90,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Text('Bad'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: Color(0xff57636F),
                      fontSize: 25,
                    ),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 2.2,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: products[index], child: catcard());
                    }),
              ],
            )
          ]),
        )
      ]),
    );
  }
}
