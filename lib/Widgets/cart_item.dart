// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  int quantity;
  final String name;
  final String image;

  BartItem(this.id, this.productId, this.price, this.quantity, this.name,
      this.image);

  @override
  State<BartItem> createState() => _BartItemState();
}

class _BartItemState extends State<BartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 135,
                width: 64,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff4D77FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              Text('${widget.quantity++} ');
                            });
                          },
                        ),
                        Text(
                          '${widget.quantity} x',
                          style: const TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (widget.quantity > 0) {
                                Text('${widget.quantity--} ');
                              }
                            });
                          },
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Container(
                  height: 140,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff57636F),
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Total: \$${(widget.price * widget.quantity)}',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff57636F),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
