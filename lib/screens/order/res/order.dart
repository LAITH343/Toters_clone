import 'package:flutter/material.dart';
import 'package:toters_clone/mainData.dart';
import 'package:toters_clone/modules/order.dart';
import 'package:toters_clone/screens/createAccount/singup.dart';

class OrderSection extends StatefulWidget {
  String restrant_name;
  int meal_price;
  String meal_name;
  String note;
  OrderSection({
    required this.restrant_name,
    required this.meal_name,
    required this.meal_price,
    required this.note,
  });
  @override
  State<OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  bool loading = false;
  Future<bool> addOrder() async {
    setState(() {
      loading = true;
    });
    bool res = await OrderApi().snedOrder(widget.meal_name,
        widget.restrant_name, itemcount, widget.note, widget.meal_price);
    if (res == true) {
      setState(() {
        loading = false;
      });
    }
    return true;
  }

  @override
  int itemcount = 1;
  String itemcountString = "1 item";
  int price = 1500;
  @override
  Widget build(BuildContext context) {
    if (itemcount == 1) {
      itemcountString = "1 item";
    } else {
      itemcountString = "$itemcount items";
    }
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Counter(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: itemcount != 0
                  ? () async {
                      if (user_name == "") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                        return;
                      }
                      bool result = await addOrder();
                      if (result) Navigator.of(context).pop();
                    }
                  : null,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: itemcount != 0 ? Colors.green.shade400 : Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          itemcountString,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Add to card",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "IQD ${price * itemcount}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding Counter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (itemcount != 0) itemcount--;
              });
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black,
              size: 20,
            ),
          ),
          Text(
            "$itemcount",
            style: const TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                itemcount++;
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
