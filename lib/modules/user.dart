import 'dart:convert';

import 'package:http/http.dart';
import 'package:toters_clone/mainData.dart';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        required this.fullName,
        required this.phoneNumber,
        required this.userLocation,
        this.regDate,
    });

    int? id;
    String fullName;
    String phoneNumber;
    String userLocation;
    String? regDate;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        userLocation: json["user_location"],
        regDate: json["reg_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "user_location": userLocation,
        "reg_date": regDate,
    };
}

class UserApi {
  Future<List<User>> getUsers() async {
    var url = Uri.parse("$apiaddress/users");
    Response data = await get(url);
    if (data.statusCode == 200) return userFromJson(data.body);
    return [];
  }

  Future<bool> addUser(String user_name, String phone_number) async {
    var url = Uri.parse("$apiaddress/users/new_user");
    Map<String, String> setheader = {"Content-type": "application/json"};
    User newUser = User(id: null, fullName: user_name, phoneNumber: phone_number, userLocation: user_location, regDate: null);
    var data = userToJson(newUser);
    Response res = await post(url, headers: setheader, body: data);
    if (res.statusCode == 200) return true;
    return false;
  }
}