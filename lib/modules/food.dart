import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Meal> mealFromJson(String str) => List<Meal>.from(json.decode(str).map((x) => Meal.fromJson(x)));

String mealToJson(List<Meal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meal {
    Meal({
        required this.id,
        required this.foodName,
        required this.restrantName,
        required this.foodPrice,
        required this.foodImg,
        required this.additions,
        required this.foodDesc,
    });

    int id;
    String foodName;
    String restrantName;
    int foodPrice;
    String foodImg;
    String additions;
    String foodDesc;

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        foodName: json["food_name"],
        restrantName: json["restrant_name"],
        foodPrice: json["food_price"],
        foodImg: json["food_img"],
        additions: json["additions"],
        foodDesc: json["food_desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "restrant_name": restrantName,
        "food_price": foodPrice,
        "food_img": foodImg,
        "additions": additions,
        "food_desc": foodDesc,
    };
}

class MealApi {
  Future<List<Meal>> getmeals(String restrant_name) async {
    var url = Uri.parse("$apiaddress/meals/$restrant_name");
    Response data = await get(url);
    if (data.statusCode == 200) return mealFromJson(data.body);
    return [];
  }
}