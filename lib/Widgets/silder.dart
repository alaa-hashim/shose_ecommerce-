// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoes_commerce_app/Models/Photos.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Silder extends StatefulWidget {
  const Silder({Key? key}) : super(key: key);

  @override
  _SilderState createState() => _SilderState();
}

class _SilderState extends State<Silder> {
  int actvieindex = 0;
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
              carouselController: controller,
              itemCount: photos.length,
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => actvieindex = index),
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIdx) {
                return Stack(children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/${photos[index]}'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned(
                    top: 140,
                    left: 20,
                    child: SizedBox(
                      height: 28,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87, // background
                        ),
                        child: Text(
                          "SHOP NOW",
                        ),
                      ),
                    ),
                  )
                ]);
              }),
          const SizedBox(
            height: 20,
          ),
          buildIndecotar(),
        ],
      ),
    );
  }

  Widget buildIndecotar() => AnimatedSmoothIndicator(
        activeIndex: actvieindex,
        count: photos.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Color(0xff126881),
        ),
      );
}
