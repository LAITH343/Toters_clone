import 'package:flutter/material.dart';

class ViewCartButtom extends StatelessWidget {
  const ViewCartButtom({
    Key? key,
    required this.itemsincard,
    required this.itemprice,
  }) : super(key: key);

  final int itemsincard;
  final int itemprice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "$itemsincard items",
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
            const Expanded(
              child: Text(
                "View cart",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "IQD $itemprice",
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
