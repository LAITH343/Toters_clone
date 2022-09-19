import 'package:flutter/material.dart';
import 'package:toters_clone/mainData.dart';
import 'package:toters_clone/modules/food.dart';
import 'package:toters_clone/modules/order.dart';
import 'package:toters_clone/modules/rate.dart';
import 'package:toters_clone/screens/restrant/res/banner.dart';
import 'package:toters_clone/screens/restrant/res/description.dart';
import 'package:toters_clone/screens/restrant/res/popular.dart';
import 'package:toters_clone/screens/restrant/res/viewCart.dart';

class RestrantHomePage extends StatefulWidget {
  final String imageasset;
  final String time;
  final String Timehourmin;
  final String label;
  final String desc;
  const RestrantHomePage({
    required this.imageasset,
    required this.time,
    required this.Timehourmin,
    required this.label,
    required this.desc,
  });

  @override
  State<RestrantHomePage> createState() => _RestrantHomePageState();
}

class _RestrantHomePageState extends State<RestrantHomePage> {
  bool dataloaded = false;
  double? restrantRate;
  int? restrantRates;
  List<Meal>? meals;
  int totalOrdersprice = 0;
  bool foundorders = false;
  int ordersCount = 0;
  getRestranData() async {
    double rate = await RateApi().getRateByName(widget.label);
    int ratesCount = await RateApi().getRateCountByName(widget.label);
    List<Meal> mealsList = await MealApi().getmeals(widget.label);
    List<Order> restrantOrders = await OrderApi().getOrdersByName(widget.label);
    if (restrantOrders.isNotEmpty && user_name != "") {
      int counter = 0;
      int totalordersCount = 0;
      for (int i = 0; i < restrantOrders.length; i++) {
        counter += restrantOrders[i].mealPrice * restrantOrders[i].foodAmount;
      }
      for (int i = 0; i < restrantOrders.length; i++) {
        totalordersCount += restrantOrders[i].foodAmount;
      }
      setState(() {
        totalOrdersprice = counter;
        ordersCount = totalordersCount;
        if (user_name != "") foundorders = true;
        print(totalOrdersprice);
      });
    }
    if (rate != 0 && mealsList.isNotEmpty) {
      setState(() {
        restrantRate = rate;
        restrantRates = ratesCount;
        meals = mealsList;
        dataloaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRestranData();
  }

  @override
  Widget build(BuildContext context) {
    int itemsincard = 0;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RestrantBanner(widget: widget),
                Visibility(
                  visible: dataloaded,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: Column(
                    children: [
                      RestrantDescription(
                        widget: widget,
                        rate: restrantRate,
                        rate_count: restrantRates,
                      ),
                      if (dataloaded == true) PopulerSection(context, meals!),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: foundorders,
          replacement: const SizedBox(),
          child: ViewCartButtom(
              itemsincard: ordersCount, itemprice: totalOrdersprice),
        ));
  }
}
