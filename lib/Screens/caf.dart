// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/category.dart';
import 'package:shoes_commerce_app/Screens/subcat.dart';

class Caf extends StatefulWidget {
  const Caf({Key? key}) : super(key: key);

  @override
  State<Caf> createState() => _CafState();
}

class _CafState extends State<Caf> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Categories>(context, listen: false).fatchcat();
    });
    super.initState();
  }

  int selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cat = Provider.of<Categories>(context, listen: false).items;

    return SafeArea(
      child: Scaffold(
        body: Row(children: [
          SizedBox(
            width: 120,
            child: ListView.separated(
              itemCount: cat.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 2);
              },
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                  child: Container(
                    child: Row(children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: (selectedIndex == index) ? 50 : 0,
                        width: 5,
                        color: Colors.blue,
                      ),
                      Expanded(
                        flex: 1,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.center,
                          height: 60,
                          color: (selectedIndex == index)
                              ? Colors.transparent
                              : Colors.blueGrey.withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            child: Text(
                              cat[index].name!,
                              style: GoogleFonts.lato(
                                  color: (selectedIndex == index)
                                      ? Colors.blue
                                      : const Color(0xff57636F),
                                  fontWeight: (selectedIndex == index)
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                controller: _pageController,
                children: [
                  Container(
                    child: const Expanded(child: Subcat()),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
