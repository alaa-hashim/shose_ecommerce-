// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce_app/Widgets/order_item.dart';
import 'package:shoes_commerce_app/providers/Orders.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({Key? key}) : super(key: key);

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchOders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : AnimationLimiter(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: orderdata.order.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 2),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: OrItem(orderdata.order[index]),
                            )));
                  }),
            ),
    );
  }
}
