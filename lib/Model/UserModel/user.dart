import 'package:flutter/cupertino.dart';

class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String password;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.password,
  });
  UserModel.fromJson(Map<dynamic, String> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }
}
