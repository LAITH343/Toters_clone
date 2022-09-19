import 'package:flutter/material.dart';

Container TagsCards(String label, Color bgcolor, Color textcolor,
    IconData cardicon, Color iconcolor) {
  return Container(
    decoration:
        BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(4)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(color: textcolor, fontSize: 14),
          ),
          Icon(
            cardicon,
            color: iconcolor,
            size: 20,
          ),
        ],
      ),
    ),
  );
}
