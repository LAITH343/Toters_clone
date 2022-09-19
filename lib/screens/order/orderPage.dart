import 'package:flutter/material.dart';
import 'package:toters_clone/screens/order/res/note.dart';
import 'package:toters_clone/screens/order/res/order.dart';

class FoodOrder extends StatefulWidget {
  final String name;
  final String imageasset;
  final int price;
  final String restrant_name;
  const FoodOrder({
    required this.name,
    required this.imageasset,
    required this.price,
    required this.restrant_name,
  });

  @override
  State<FoodOrder> createState() => _FoodOrderState();
}

class _FoodOrderState extends State<FoodOrder> {
  @override
  TextEditingController NoteCont = TextEditingController();
  bool CheckState = false;
  bool CheckState2 = false;
  int num = 0;
  int itemcount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrderAppBar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  FoodImg(widget: widget),
                  FoodDetials(),
                  NoteWidget(NoteCont: NoteCont),
                ],
              ),
            ),
            OrderSection(
                meal_name: widget.name,
                meal_price: widget.price,
                note: NoteCont.text,
                restrant_name: widget.restrant_name)
          ],
        ),
      ),
    );
  }

  Container FoodDetials() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              widget.name,
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.4)),
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              "${widget.price} IQD",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }

  AppBar OrderAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.share_outlined,
          color: Colors.black,
          size: 25,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.favorite_outline,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class FoodImg extends StatelessWidget {
  const FoodImg({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final FoodOrder widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imageasset), fit: BoxFit.cover)),
    );
  }
}
