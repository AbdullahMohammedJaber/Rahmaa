import 'package:flutter/cupertino.dart';

class OrderModel {
  String idOrder;
  String idUser;
  String idAdmin;
  List products;
  double total;
  String nameUser;
  String nameRes;
  String location;
  double latAdmin;
  double longAdmin;
  double latUser;
  double longUser;
  String nameLocationUser;
  String phoneUser;
  String phoneAdmin;
  String nameAdmin;

  OrderModel(
      {@required this.idOrder,
      @required this.idUser,
      @required this.nameAdmin,
      @required this.idAdmin,
      @required this.products,
      @required this.total,
      @required this.nameUser,
      @required this.nameRes,
      @required this.location,
      @required this.latAdmin,
      @required this.longAdmin,
      @required this.latUser,
      @required this.longUser,
      @required this.nameLocationUser,
      @required this.phoneUser,
      @required this.phoneAdmin});
  OrderModel.fromJson(Map<String, dynamic> json) {
    idOrder = json['idOrder'];
    idUser = json['idUser'];
    idAdmin = json['idAdmin'];
    products = json['products'];
    nameUser = json['nameUser'];
    nameRes = json['nameRes'];
    location = json['location'];
    latAdmin = json['latAdmin'];
    longAdmin = json['longAdmin'];
    latUser = json['latUser'];
    longUser = json['longUser'];
    nameLocationUser = json['nameLocationUser'];
    phoneUser = json['phoneUser'];
    phoneAdmin = json['phoneAdmin'];
    nameAdmin = json['nameAdmin'];
  }
  Map<String, dynamic> toMap() {
    return {
      'idOrder': idOrder,
      'idUser': idUser,
      'idAdmin': idAdmin,
      'products': products,
      'nameUser': nameUser,
      'nameRes': nameRes,
      'location': location,
      'latAdmin': latAdmin,
      'longAdmin': longAdmin,
      'latUser': latUser,
      'longUser': longUser,
      'nameLocationUser': nameLocationUser,
      'phoneUser': phoneUser,
      'phoneAdmin': phoneAdmin,
      'nameAdmin': nameAdmin,
    };
  }
}
