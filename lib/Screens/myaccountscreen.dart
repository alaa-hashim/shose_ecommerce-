// ignore_for_file: use_key_in_widget_constructors, null_check_always_fails, sized_box_for_whitespace, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shoes_commerce_app/Screens/Homepage.dart';
import 'package:shoes_commerce_app/Screens/OrdersScreen.dart';
import 'package:shoes_commerce_app/Screens/caf.dart';

class Accountpage extends StatefulWidget {
  @override
  _AccountpageState createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) return;
    final iamgetemporary = File(image.path);

    setState(() {
      this.image = iamgetemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            // Important: Remov
            //e any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Container(
                                height: 150,
                                child: Center(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Please Choose Image",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff126881),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.photo_outlined,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 20),
                                                  Text(
                                                    "From Gallery",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff126881),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                        const Divider(
                                          thickness: 1,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            pickImage(ImageSource.camera);
                                          },
                                          child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.camera,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 20),
                                                  Text(
                                                    "From Camera",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff126881),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )
                                      ]),
                                )),
                          );
                        });
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          child: image != null
                              ? Image.file(
                                  image!,
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                )
                              : Stack(children: [
                                  Container(
                                    height: 140,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://i.pinimg.com/originals/50/05/f5/5005f514424141acf70727360add163d.png'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xff126881),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                // ignore: unnecessary_const
                child: Text('My Account',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff126881),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                          // Co
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.favorite,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 28.0),
                              child: Text('My favorites',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff126881),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Caf();
                          }));
                          // Co
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.people,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'My account',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff126881),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.location_city,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Addresses',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff126881),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Orderscreen();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.receipt,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('My orders',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff126881),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.credit_card,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('My payment',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff126881),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Accountpage();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Color(0xff126881),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Stttings',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff126881),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 48.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff126881),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
