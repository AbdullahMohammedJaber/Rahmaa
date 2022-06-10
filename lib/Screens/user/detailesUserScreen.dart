import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rahmaa/Auth/family_product/google_map.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';

class DetailsUserScreen extends StatefulWidget {
  final String imageProd;
  final String nameres;
  final String name;
  final String price;
  final String des;
  final String location;
  final double lat;
  final double long;
  final String nameProd;
  final String idProduct;
  final String idUser;
  final int count;
  const DetailsUserScreen({
    @required this.imageProd,
    @required this.nameres,
    @required this.name,
    @required this.count,
    @required this.price,
    @required this.des,
    @required this.location,
    @required this.lat,
    @required this.long,
    @required this.nameProd,
    @required this.idProduct,
    @required this.idUser,
  });

  @override
  State<DetailsUserScreen> createState() => _DetailsUserScreenState();
}

bool fav = false;

class _DetailsUserScreenState extends State<DetailsUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {
        if (state is AddFavoraitesSucessfully) {
          Fluttertoast.showToast(
              msg: "تم إضافة المفضلة بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(this.widget.nameProd),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(this.widget.imageProd),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      UserCubit.get(context).getFavorites(
                        uId: this.widget.idUser,
                        pId: this.widget.idProduct,
                        nameUser: this.widget.name,
                        nameRes: this.widget.nameres,
                        lat: this.widget.lat,
                        long: this.widget.long,
                        street: this.widget.location,
                        nameProduct: this.widget.nameProd,
                        priceProduct: this.widget.price,
                        desProduct: this.widget.des,
                        imageProduct: this.widget.imageProd,
                      );
                    },
                    icon: UserCubit.get(context)
                            .fav
                            .contains(this.widget.idProduct)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      UserCubit.get(context).getCart(
                        count: this.widget.count,
                        uId: this.widget.idUser,
                        pId: this.widget.idProduct,
                        nameUser: this.widget.name,
                        nameRes: this.widget.nameres,
                        lat: this.widget.lat,
                        long: this.widget.long,
                        street: this.widget.location,
                        nameProduct: this.widget.nameProd,
                        priceProduct: this.widget.price,
                        desProduct: this.widget.des,
                        imageProduct: this.widget.imageProd,
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(this.widget.nameProd),
                      Text(
                        " :الإسم ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(this.widget.nameres),
                      Text(
                        " : إسم المطعم ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(this.widget.price + " \$"),
                      Text(
                        " : السعر ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          this.widget.des,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Text(
                        " : الوصف ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'fontMy',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(this.widget.name),
                      Text(
                        " : إسم الطاهي ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "الموقع الجغرافي",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GoogleMapScreen(),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
