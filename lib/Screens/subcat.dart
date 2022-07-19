import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Models/subcategory.dart';

class Subcat extends StatefulWidget {
  const Subcat({Key? key}) : super(key: key);

  @override
  State<Subcat> createState() => _SubcatState();
}

class _SubcatState extends State<Subcat> {
  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Subcategories>(context, listen: false).getsub();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sub = Provider.of<Subcategories>(context, listen: false).items;
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.10,
        childAspectRatio: 0.70,
      ),
      itemCount: sub.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05),
                  color: const Color(0xffefeff2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(sub[index].image!),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    Text(sub[index].name!,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
