// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:shoes_commerce_app/Screens/Detailspage.dart';
import 'package:shoes_commerce_app/providers/cart.dart';

class catcard extends StatefulWidget {
  catcard({Key? key}) : super(key: key);

  @override
  State<catcard> createState() => _catcardState();
}

class _catcardState extends State<catcard> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Details.routeName,
          arguments: product.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 190,
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(product.image!),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          product.name!,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff57636F),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '\$${product.price.toString()}',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff57636F),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: const Color(0xff7BCFE9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),

                            onPressed: () {
                              cart.addItem(
                                product.id!,
                                product.price!,
                                product.name!,
                                product.image!,
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          product.isFavorite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        color: const Color(0xffE4126B),
                        onPressed: () {
                          product.toggleisFavorite();
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
