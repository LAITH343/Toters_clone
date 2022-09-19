import 'dart:convert';
import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.id,
        required this.userName,
        required this.userPhone,
        required this.foodName,
        required this.restrantName,
        required this.foodAmount,
        required this.userLocation,
        required this.note,
        required this.mealPrice,
    });

    int? id;
    String userName;
    String userPhone;
    String foodName;
    String restrantName;
    int foodAmount;
    String userLocation;
    String note;
    int mealPrice;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userName: json["user_name"],
        userPhone: json["user_phone"],
        foodName: json["food_name"],
        restrantName: json["restrant_name"],
        foodAmount: json["food_amount"],
        userLocation: json["user_location"],
        note: json["note"],
        mealPrice: json["meal_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_phone": userPhone,
        "food_name": foodName,
        "restrant_name": restrantName,
        "food_amount": foodAmount,
        "user_location": userLocation,
        "note": note,
        "meal_price": mealPrice,
    };
}



class OrderApi {
  Future<List<Order>> getOrders() async {
    var url = Uri.parse("$apiaddress/orders");
    Response data = await get(url);
    if (data.statusCode == 200) return orderFromJson(data.body);
    return [];
  }

  Future<List<Order>> getOrdersByName(String restrant_name) async {
    var url = Uri.parse("$apiaddress/orders/$restrant_name");
    Response data = await get(url);
    if (data.statusCode == 200) return orderFromJson(data.body);
    return [];
  }

  Future<List<Order>> getOrdersByUserName() async {
    var url = Uri.parse("$apiaddress/orders/user/$user_name");
    Response data = await get(url);
    if (data.statusCode == 200) return orderFromJson(data.body);
    return [];
  }

  Future<bool> snedOrder(String food_name, String restrant_name, int amount, String note, int meaLPrice) async { 
    var url = Uri.parse("$apiaddress/orders/add_order");
    var data = Order(id: null, userName: user_name, userPhone: user_phone, foodName: food_name, restrantName: restrant_name, foodAmount: amount, userLocation: user_location, note: note, mealPrice: meaLPrice);
    var datatojson = orderToJson(data);
    Map<String, String> setheader = {"Content-type": "application/json"};
    Response res = await post(url, headers: setheader, body: datatojson);
    if (res.statusCode == 200)return true;
    return false;
  }
}