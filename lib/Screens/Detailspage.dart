// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, duplicate_ignore, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Screens/cart-screen.dart';

import 'package:shoes_commerce_app/constants.dart';
import 'package:shoes_commerce_app/providers/cart.dart';
import 'package:shoes_commerce_app/providers/products.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);
  static const routeName = '/product-details';

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
    ).findById(productId);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            loadedProduct.name!,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 23,
            ),
          )),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                loadedProduct.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: const Color(0xffE4126B),
              onPressed: () {
                loadedProduct.toggleisFavorite();
              },
            ),
          ],
          backgroundColor: PKcolor,
          elevation: 0,
        ),
        backgroundColor: PKcolor,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 200,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 155,
                          width: 115,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(loadedProduct.image!),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            loadedProduct.name!,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      loadedProduct.description!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 98,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        child: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.shopping_cart,
                            color: const Color(0xff7BCFE9),
                            size: 44,
                          ),

                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(CartScreen.routeName);
                          },
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Color(0xffefeff2),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xff126881),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff126881), // background
                            // foreground
                          ),
                          onPressed: () {
                            cart.addItem(
                                loadedProduct.id!,
                                loadedProduct.price!,
                                loadedProduct.name!,
                                loadedProduct.image!);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CartScreen();
                            }));
                          },
                          child: Text('Buy Product',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
