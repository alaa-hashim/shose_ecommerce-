// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shoes_commerce_app/providers/Orders.dart';
import 'package:intl/intl.dart';

class OrItem extends StatefulWidget {
  late final OrderItem order;
  OrItem(this.order);

  @override
  State<OrItem> createState() => _OrItemState();
}

class _OrItemState extends State<OrItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(children: [
          ListTile(
            subtitle: Text(
                DateFormat('dd mm yyyy hh:mm').format(widget.order.datetime)),
          ),
          Expanded(
            child: Column(
              children: widget.order.products
                  .map((e) => SizedBox(
                        height: 110,
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 115,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(e.image),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Column(
                              children: [
                                Text(e.name),
                                Text('\$${e.price.toString()}'),
                                Text('${e.quantity} x')
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ]),
      ),
    );
  }
}
