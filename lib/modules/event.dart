import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
    Event({
        required this.id,
        required this.header,
        required this.subheader,
        required this.restrantsList,
    });

    int id;
    String header;
    String subheader;
    String restrantsList;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        header: json["header"],
        subheader: json["subheader"],
        restrantsList: json["restrants_list"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "subheader": subheader,
        "restrants_list": restrantsList,
    };
}

class EventsApi {
  Future<List<Event>> getEvents() async {
    var url = Uri.parse("$apiaddress/events");
    Response data = await get(url);
    if (data.statusCode == 200) return eventFromJson(data.body);
    return [];
  }
}