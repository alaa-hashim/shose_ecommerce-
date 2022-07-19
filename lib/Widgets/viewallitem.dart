// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:shoes_commerce_app/providers/products.dart';

class Viewitem extends StatefulWidget {
  @override
  State<Viewitem> createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context, listen: false).fetchAlbum();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    // ignore: avoid_print
    print(product.name! + "alaa");
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 135,
                      width: 115,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(product.image!),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      product.name!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff57636F),
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
                      ),
                    ),
                  ),
                ])));
  }
}
