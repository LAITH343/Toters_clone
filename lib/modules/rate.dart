import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Rate> rateFromJson(String str) => List<Rate>.from(json.decode(str).map((x) => Rate.fromJson(x)));

String rateToJson(List<Rate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rate {
    Rate({
        required this.id,
        required this.userName,
        required this.restrantName,
        required this.userRate,
    });

    int id;
    String userName;
    String restrantName;
    int userRate;

    factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        id: json["id"],
        userName: json["user_name"],
        restrantName: json["restrant_name"],
        userRate: json["user_rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "restrant_name": restrantName,
        "user_rate": userRate,
    };
}

class RateApi {
  Future<List<Rate>> getRates() async {
    var url = Uri.parse("$apiaddress/rates");
    Response data = await get(url);
    if (data.statusCode == 200) return rateFromJson(data.body);
    return [];
  }
  
  Future<double> getRateByName(String restrant_name) async {
    var url = Uri.parse("$apiaddress/rates/$restrant_name");
    Response data = await get(url);
    List<Rate> rates = rateFromJson(data.body);
    int total_rate = 0;
    for (int i=0;i<rates.length;i++) total_rate += rates[i].userRate;
    if (data.statusCode == 200) return (total_rate/rates.length);
    return 0;
  }

  Future<int> getRateCountByName(String restrant_name) async {
     var url = Uri.parse("$apiaddress/rates/$restrant_name");
    Response data = await get(url);
    List<Rate> rates = rateFromJson(data.body);
    if (data.statusCode == 200) return rates.length;
    return 0;
  }
}