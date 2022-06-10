import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rahmaa/Auth/family_product/google_map.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';

class DetailsScreen extends StatelessWidget {
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
  const DetailsScreen({
    @required this.imageProd,
    @required this.nameres,
    @required this.name,
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
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {
        if (state is DeleteProductisSuccessfully) {
          Fluttertoast.showToast(
              msg: "The Delete Product Done",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(this.nameProd),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(this.imageProd),
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
                children: [
                  Text(
                    "Title : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(this.nameProd),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      FamilyCubit.get(context)
                          .deleteProduct(id: this.idProduct);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Name resturant : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(this.nameres),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Price Product : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(this.price + " \$"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Description : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      this.des,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Name Admin : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(this.name),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      "Go Location",
                      style: TextStyle(
                          fontSize: 18,
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
