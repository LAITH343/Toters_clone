import 'package:flutter/material.dart';

Padding CardMaker(var context, String Imageasset, String Name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: (MediaQuery.of(context).size.width * 0.34) - 40,
      width: (MediaQuery.of(context).size.width * 0.36) - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 2))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            Imageasset,
            width: (MediaQuery.of(context).size.width * 0.34) * 0.5,
            height: (MediaQuery.of(context).size.width * 0.34) * 0.5,
          ),
          Text(
            Name,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ],
      ),
    ),
  );
}
