import 'package:flutter/material.dart';
import 'package:shoes_commerce_app/Models/product.dart';

class Pageview extends StatefulWidget {
  const Pageview({Key? key}) : super(key: key);

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: ListView(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/${images[index]}'),
                      )),
                );
              }),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 35,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFF191B),
                    ),
                    onPressed: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 255),
                          curve: Curves.bounceInOut);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff2363F6),
                    ),
                    onPressed: () {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 255),
                          curve: Curves.bounceInOut);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffCAC9DA),
                    ),
                    onPressed: () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 255),
                          curve: Curves.bounceInOut);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFFB23E),
                    ),
                    onPressed: () {
                      pageController.animateToPage(3,
                          duration: const Duration(milliseconds: 255),
                          curve: Curves.bounceInOut);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff068E4C),
                    ),
                    onPressed: () {
                      pageController.animateToPage(3,
                          duration: const Duration(milliseconds: 255),
                          curve: Curves.bounceInOut);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    color: Color(0xffFFA771),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.card_giftcard_outlined),
                      const Text('1.500'),
                      Column(
                        children: const [
                          Icon(Icons.arrow_upward_outlined),
                          Text('Pay'),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.add),
                          Text('Top up'),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.menu),
                          Text('More'),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
