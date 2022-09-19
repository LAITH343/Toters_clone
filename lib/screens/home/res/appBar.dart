import 'package:flutter/material.dart';
import 'package:toters_clone/mainData.dart';
import 'package:toters_clone/screens/cart/cartPage.dart';

AppBar HomeAppBar(var context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivering To",
          style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 15),
        ),
        Row(
          children: const [
            Text(
              "Baghdad, Iraq",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  wordSpacing: 1,
                  letterSpacing: 0.5),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.black,
            )
          ],
        )
      ],
    ),
    actions: [
      user_name != ""
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartPage()));
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                        size: 25,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey,
                        size: 25,
                      )),
                ),
              ],
            )
          : const SizedBox(),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.sort,
              color: Colors.grey,
              size: 25,
            )),
      ),
    ],
  );
}
