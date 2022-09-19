import 'package:flutter/material.dart';
import 'package:toters_clone/modules/food.dart';
import 'package:toters_clone/screens/order/orderPage.dart';

Column PopulerSection(BuildContext context, List<Meal>? meals) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Meals",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: meals!.length,
              itemBuilder: (context, index) {
                return popularFoodCard(
                    context,
                    meals[index].foodImg,
                    meals[index].foodName,
                    meals[index].foodPrice,
                    meals[index].restrantName);
              },
            ),
          ),
        ],
      ),
    ],
  );
}

Padding popularFoodCard(BuildContext context, String imagurl, String foodName,
    int price, String restrantName) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: SizedBox(
      width: 241,
      height: 240,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FoodOrder(
                    imageasset: imagurl,
                    name: foodName,
                    price: price,
                    restrant_name: restrantName,
                  )));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imagurl),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "IQD $price",
                    style: const TextStyle(fontSize: 15, color: Colors.green),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
