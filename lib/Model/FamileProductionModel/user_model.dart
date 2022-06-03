import 'package:flutter/cupertino.dart';

class FamilyUserModel {
  String id;
  String name;
  String email;
  String phone;
  String password;
  double lat;
  double long;
  String image;
  String des;
  String nameres;
  String street;

  FamilyUserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.password,
    @required this.lat,
    @required this.long,
    @required this.street,
    @required this.des,
    @required this.image,
    @required this.nameres,
  });
  FamilyUserModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    lat = json['lat'];
    long = json['long'];
    street = json['street'];
    des = json['des'];
    image = json['image'];
    nameres = json['nameres'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'lat': lat,
      'long': long,
      'nameres': nameres,
      'des': des,
      'image': image,
      'street': street,
    };
  }
}
