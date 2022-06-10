import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';

class FavoritesFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    AlertDialog alert = AlertDialog(
                      title: Text(
                        "حذف المنتجات كافة",
                        style: TextStyle(
                          fontFamily: 'fontMy',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      content: Text(
                        "هل تريد حذف كافة المنتجات من المفضلة ؟ ",
                        style: TextStyle(
                          fontFamily: 'fontMy',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      actions: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () {
                            UserCubit.get(context).clearFav();
                            Navigator.pop(context);
                          },
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "نعم",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fontMy',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "لا",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fontMy',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            body: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "${UserCubit.get(context).fav[index].imageProduct}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 150,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(UserCubit.get(context).fav[index].nameProduct,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              "${UserCubit.get(context).fav[index].priceProduct} \$",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(UserCubit.get(context).fav[index].nameRes,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          UserCubit.get(context)
                              .removeFav(UserCubit.get(context).fav[index].pId);
                        },
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: UserCubit.get(context).fav.length,
            ),
          );
        },
        listener: (context, state) {});
  }
}
