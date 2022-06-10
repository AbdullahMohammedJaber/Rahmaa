import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Screens/user/order.dart';

class CartsFull extends StatefulWidget {
  @override
  State<CartsFull> createState() => _CartsFullState();
}

class _CartsFullState extends State<CartsFull> {
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
                        "هل تريد حذف كافة المنتجات من السلة الشرائية ؟ ",
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
                            UserCubit.get(context).clearCat();
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
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      // var sup = double.parse(
                      //         UserCubit.get(context).cat[index].priceProduct) *
                      //     UserCubit.get(context).cat[index].count;

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
                                  "${UserCubit.get(context).cat[index].imageProduct}",
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
                                Text(
                                    UserCubit.get(context)
                                        .cat[index]
                                        .nameProduct,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    "${UserCubit.get(context).cat[index].priceProduct} \$",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(UserCubit.get(context).cat[index].nameRes,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          UserCubit.get(context).max(
                                              productId: UserCubit.get(context)
                                                  .cat[index]
                                                  .pId);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.green,
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                        '${UserCubit.get(context).cat[index].count}'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (UserCubit.get(context)
                                                .cat[index]
                                                .count >
                                            1) {
                                          setState(() {
                                            UserCubit.get(context).min(
                                                productId:
                                                    UserCubit.get(context)
                                                        .cat[index]
                                                        .pId);
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   children: [
                                //     Text('Sup :'),
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     // Text(
                                //     //   '${sup}',
                                //     //   style: TextStyle(),
                                //     //   maxLines: 1,
                                //     //   overflow: TextOverflow.ellipsis,
                                //     // ),
                                //   ],
                                // ),
                              ],
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
                    itemCount: UserCubit.get(context).cat.length,
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 72, 138, 236),
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          '${UserCubit.get(context).total}  :المجموع ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'fontMy',
                          ),
                        ),
                        Spacer(),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Order()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'إكمال الدفع',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'fontMy',
                            ),
                          ),
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
