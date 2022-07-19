import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/category.dart';
import 'package:shoes_commerce_app/Screens/viewall.dart';

class Catscreen extends StatefulWidget {
  const Catscreen({Key? key}) : super(key: key);

  @override
  _CatscreenState createState() => _CatscreenState();
}

class _CatscreenState extends State<Catscreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Categories>(context, listen: false).fatchcat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context, listen: false).items;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const viewall();
        }));
      },
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.10,
            childAspectRatio: 1.35,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffefeff2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(categories[index].image!),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Text(categories[index].name!,
                            style: GoogleFonts.lato(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
