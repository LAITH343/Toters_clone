import 'package:flutter/material.dart';

AppBar CartAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back,
        size: 25,
        color: Colors.black,
      ),
    ),
    title: const Text(
      "My Cart",
      style: TextStyle(fontSize: 18, color: Colors.black),
    ),
  );
}
