import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Offer> offerFromJson(String str) => List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
    Offer({
        required this.id,
        required this.imgurl,
        required this.tagcode,
    });

    int id;
    String imgurl;
    String tagcode;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        imgurl: json["imgurl"],
        tagcode: json["tagcode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imgurl": imgurl,
        "tagcode": tagcode,
    };
}

class OfferApi {
  Future<List<Offer>> getoffers() async {
    var url = Uri.parse("$apiaddress/offers");
    Response data = await get(url);
    if (data.statusCode == 200) return offerFromJson(data.body);
    return [];
  }
}