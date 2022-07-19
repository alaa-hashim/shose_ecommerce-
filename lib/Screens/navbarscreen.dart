// ignore_for_file: unused_import

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shoes_commerce_app/Screens/Homepage.dart';
import 'package:shoes_commerce_app/Screens/caf.dart';
import 'package:shoes_commerce_app/Screens/cart-screen.dart';
import 'package:shoes_commerce_app/Screens/categoryscreen.dart';
import 'package:shoes_commerce_app/Screens/catscreen.dart';
import 'package:shoes_commerce_app/Screens/myaccountscreen.dart';
import 'package:shoes_commerce_app/Widgets/Staggview.dart';

class Navr extends StatefulWidget {
  const Navr({required Key? key}) : super(key: key);

  @override
  _NavrState createState() => _NavrState();
}

class _NavrState extends State<Navr> {
  int pageindex = 0;
  List<Widget> pagelist = <Widget>[
    Home(),
    const Caf(),
    const catgepage(),
    const CartScreen(),
    Accountpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primayAnimation, secondryAnimation) =>
            FadeThroughTransition(
          animation: primayAnimation,
          secondaryAnimation: secondryAnimation,
          child: child,
        ),
        child: pagelist[pageindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: pageindex,
        selectedIconTheme: const IconThemeData(
          color: Color(0xff126881),
        ),
        selectedItemColor: const Color(0xff126881),
        selectedFontSize: 15,
        unselectedItemColor: const Color(0xffA7B99E),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: (value) {
          setState(() {
            pageindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'My account',
          ),
        ],
      ),
    );
  }
}
