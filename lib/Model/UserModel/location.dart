import 'package:flutter/cupertino.dart';

class LocationModelUser {
  String name;
  double lat;
  double long;

  LocationModelUser({
    @required this.name,
    @required this.lat,
    @required this.long,
  });
  LocationModelUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'long': long,
    };
  }
}
