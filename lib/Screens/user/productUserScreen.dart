import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Screens/Family/details_screen.dart';
import 'package:rahmaa/Screens/user/detailesUserScreen.dart';

class ProductUserScreen extends StatelessWidget {
  const ProductUserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        var productmy = UserCubit.get(context).products;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 4.6,
                ),
                itemCount: productmy.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsUserScreen(
                            idProduct: productmy[index].pId,
                            idUser: productmy[index].uId,
                            des: productmy[index].desProduct,
                            imageProd: productmy[index].imageProduct,
                            lat: productmy[index].lat,
                            long: productmy[index].long,
                            location: productmy[index].street,
                            name: productmy[index].nameUser,
                            nameProd: productmy[index].nameProduct,
                            nameres: productmy[index].nameRes,
                            price: productmy[index].priceProduct,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "${productmy[index].imageProduct}",
                                  fit: BoxFit.cover,
                                )),
                            height: 200,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${productmy[index].nameProduct}  : إسم المنتج",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${productmy[index].nameRes} :  إسم المطعم",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              " السعر:  \$${productmy[index].priceProduct}",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  UserCubit.get(context).getFavorites(
                                    uId: productmy[index].uId,
                                    pId: productmy[index].pId,
                                    nameUser: productmy[index].nameUser,
                                    nameRes: productmy[index].nameRes,
                                    lat: productmy[index].lat,
                                    long: productmy[index].long,
                                    street: productmy[index].street,
                                    nameProduct: productmy[index].nameProduct,
                                    priceProduct: productmy[index].priceProduct,
                                    desProduct: productmy[index].desProduct,
                                    imageProduct: productmy[index].imageProduct,
                                  );
                                },
                                icon: UserCubit.get(context)
                                        .fav
                                        .contains(productmy[index].uId)
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
                                    count: productmy[index].count,
                                    uId: productmy[index].uId,
                                    pId: productmy[index].pId,
                                    nameUser: productmy[index].nameUser,
                                    nameRes: productmy[index].nameRes,
                                    lat: productmy[index].lat,
                                    long: productmy[index].long,
                                    street: productmy[index].street,
                                    nameProduct: productmy[index].nameProduct,
                                    priceProduct: productmy[index].priceProduct,
                                    desProduct: productmy[index].desProduct,
                                    imageProduct: productmy[index].imageProduct,
                                  );
                                },
                                icon: Icon(Icons.shopping_cart),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
