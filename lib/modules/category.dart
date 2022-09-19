import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
    Category({
        required this.id,
        required this.label,
        required this.imgurl,
        required this.tagcode,
    });

    int id;
    String label;
    String imgurl;
    String tagcode;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        label: json["label"],
        imgurl: json["imgurl"],
        tagcode: json["tagcode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "imgurl": imgurl,
        "tagcode": tagcode,
    };
}

class CategoryApi {
  Future<List<Category>> getCategorys() async {
    var url = Uri.parse("$apiaddress/categorys");
    Response data = await get(url);
    if (data.statusCode == 200) return categoryFromJson(data.body);
    return [];
  }
}