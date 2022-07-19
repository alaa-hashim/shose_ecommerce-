import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/product.dart';
import 'package:shoes_commerce_app/Screens/Detailspage.dart';
import 'package:shoes_commerce_app/providers/cart.dart';

class Pitem extends StatefulWidget {
  const Pitem({Key? key}) : super(key: key);

  @override
  State<Pitem> createState() => _PitemState();
}

class _PitemState extends State<Pitem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(context, listen: false);

    // ignore: avoid_print

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Details.routeName,
          arguments: product.id,
        );
      },
      child: Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.add,
                          color: const Color(0xff7BCFE9),
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
          )),
    );
  }
}
