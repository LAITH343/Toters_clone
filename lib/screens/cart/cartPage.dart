import 'package:flutter/material.dart';
import 'package:toters_clone/modules/order.dart';
import 'package:toters_clone/screens/cart/src/CartAppBar.dart';
import 'package:toters_clone/screens/cart/src/checkoutbutton.dart';
import 'package:toters_clone/screens/cart/src/itemWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  bool dataloaded = false;
  int? totalPrice;
  List<Order>? allOrders;
  getallOrders() async {
    List<Order> orders = await OrderApi().getOrdersByUserName();
    int counter = 0;
    for (int i = 0; i < orders.length; i++) {
      counter += orders[i].foodAmount * orders[i].mealPrice;
    }
    setState(() {
      allOrders = orders;
      totalPrice = counter;
      dataloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getallOrders();
  }

  bool send_cutlery = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(context),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Your Order",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              allOrders?[0].restrantName ?? " ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          Visibility(
            visible: dataloaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dataloaded == true ? allOrders!.length : 0,
              itemBuilder: (context, index) {
                return ItemWidget(
                    itemcount: index + 1,
                    foodname:
                        "${allOrders![index].foodName} * ${allOrders![index].foodAmount}",
                    foodwight: ".",
                    foodprice: allOrders![index].mealPrice *
                        allOrders![index].foodAmount);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: send_cutlery,
                  onChanged: (val) {
                    setState(() {
                      send_cutlery = val!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                ),
                const Text(
                  "Please do not send cutlery",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 10,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subtotal",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "IQD $totalPrice",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CheckoutButton(),
    );
  }
}
