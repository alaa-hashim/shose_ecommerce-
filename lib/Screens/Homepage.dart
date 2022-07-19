// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Screens/cart-screen.dart';
import 'package:shoes_commerce_app/Screens/categoryscreen.dart';
import 'package:shoes_commerce_app/Screens/productscreen.dart';
import 'package:shoes_commerce_app/Widgets/silder.dart';
import 'package:shoes_commerce_app/constants.dart';
import 'package:shoes_commerce_app/providers/cart.dart';
import 'package:shoes_commerce_app/providers/products.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _isInit = true;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {});
      Provider.of<Products>(context).fetchAlbum().then((_) {
        setState(() {});
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      backgroundColor: PKcolor,
      appBar: AppBar(
        backgroundColor: PKcolor,
        actions: [
          Row(
            children: [
              Text(
                cart.itemcount.toString(),
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.shopping_cart,
                  color: const Color(0xff7BCFE9),
                ),

                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ],
          )
        ],
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          height: 50,
                          width: 300,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Search'),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Silder(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        height: 230,
                        child: Catscreen()),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables

                  Padding(
                    padding:
                        const EdgeInsets.only(right: 210, top: 10, bottom: 10),
                    child: Text(
                      'Most Popular',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff57636F),
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Pscreen(),
                ],
              ),
            ]))
      ]),
    );
  }
}
