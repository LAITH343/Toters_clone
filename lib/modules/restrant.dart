import 'dart:convert';
import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Restrant> restrantFromJson(String str) => List<Restrant>.from(json.decode(str).map((x) => Restrant.fromJson(x)));

String restrantToJson(List<Restrant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restrant {
    Restrant({
        required this.id,
        required this.restrantName,
        required this.restrantDesc,
        required this.restrantLocation,
        required this.dPrice,
        required this.makeTime,
        required this.restrantTags,
        required this.restrantImg,
        required this.restrantType,
    });

    int id;
    String restrantName;
    String restrantDesc;
    String restrantLocation;
    int dPrice;
    String makeTime;
    String restrantTags;
    String restrantImg;
    String restrantType;

    factory Restrant.fromJson(Map<String, dynamic> json) => Restrant(
        id: json["id"],
        restrantName: json["restrant_name"],
        restrantDesc: json["restrant_desc"],
        restrantLocation: json["restrant_location"],
        dPrice: json["D_price"],
        makeTime: json["make_time"],
        restrantTags: json["restrant_tags"],
        restrantImg: json["restrant_img"],
        restrantType: json["restrant_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restrant_name": restrantName,
        "restrant_desc": restrantDesc,
        "restrant_location": restrantLocation,
        "D_price": dPrice,
        "make_time": makeTime,
        "restrant_tags": restrantTags,
        "restrant_img": restrantImg,
        "restrant_type": restrantType,
    };
}


class RestrantApi {
  Future<List<Restrant>> getRestrants() async {
    var url = Uri.parse("$apiaddress/restrants");
    Response data = await get(url);
    if (data.statusCode == 200) return restrantFromJson(data.body);
    return [];
  }

  Future<Restrant?> getRestrantsByName(String restrant_name) async {
    var url = Uri.parse("$apiaddress/restrants/$restrant_name");
    Response data = await get(url);
    var restrants_data_list = restrantFromJson(data.body);
    if (data.statusCode == 200) return restrants_data_list[0];
    return null;
  }
}