import 'package:flutter/cupertino.dart';

class ProductModel{
    String uId;
    String pId;
    String nameUser;
    String nameRes;
    double lat;
    double long;
    String nameProduct;
    String priceProduct;
    String desProduct;
    String imageProduct;
    String count;

  ProductModel({
    @required this.uId,
    @required this.pId,
    @required this.nameUser,
    @required this.nameRes,
    @required this.lat,
    @required this.long,
    @required this.nameProduct,
    @required this.priceProduct,
    @required this.desProduct,
    @required this.imageProduct,
    @required this.count,
  });
    ProductModel.fromJson(Map <dynamic,dynamic> toJson)
    {

      this.nameRes  = toJson['nameRes'];
      this.lat  = toJson['lat'];
      this.pId  = toJson['pId'];
      this.priceProduct  = toJson['priceProduct'];
      this.nameUser  = toJson['nameUser'];
      this.uId  = toJson['uId'];
      this.imageProduct  = toJson['imageProduct'];
      this.count  = toJson['count'];
      this.nameProduct  = toJson['nameProduct'];
      this.long = toJson['long'];
      this.desProduct  = toJson['desProduct'];



    }
    Map <dynamic,dynamic> toMap(){
      return {
        'uId' :uId,
        'pId' :pId,
        'nameUser':nameUser,
        'nameRes':nameRes,
        'lat':lat,
        'long':long,
        'nameProduct ':nameProduct,
        'priceProduct':priceProduct,
        'desProduct':desProduct,
        'imageProduct':imageProduct,
        'count':count,
    };
}
}