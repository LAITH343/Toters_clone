import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.itemcount,
    required this.foodname,
    required this.foodwight,
    required this.foodprice,
  }) : super(key: key);

  final int itemcount;
  final String foodname;
  final String foodwight;
  final int foodprice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "$itemcount",
                  style: const TextStyle(color: Colors.green, fontSize: 14),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      foodname,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Text(
                    foodwight,
                    style: TextStyle(
                        fontSize: 11, color: Colors.black.withOpacity(0.4)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "IQD $foodprice",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
