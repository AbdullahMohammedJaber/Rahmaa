import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Screens/Family/details_screen.dart';
import 'package:rahmaa/Screens/user/detailesUserScreen.dart';

class HomeUser extends StatelessWidget {
  final List<String> imgList = [
    'https://img.freepik.com/free-photo/portrait-smiling-young-woman-welcoming-customers-buy-sandwich-street-food-cart_274689-29210.jpg?w=740',
    'https://img.freepik.com/free-photo/table-with-inscription-salle-green-background_118454-23646.jpg?w=740',
    'https://img.freepik.com/free-photo/indian-happy-woman-salling-spices-bazaar-goa_175356-9251.jpg?w=740',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var productmy = UserCubit.get(context).products;
          return Scaffold(
            backgroundColor: Colors.white,
            body: productmy.length == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  disableCenter: true,
                                  enableInfiniteScroll: true,
                                  enlargeCenterPage: true,
                                  pageSnapping: true,
                                  autoPlayInterval: Duration(seconds: 2),
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 2),
                                  autoPlayCurve: Curves.easeInOut,
                                ),
                                items: imgList
                                    .map((item) => Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            child: Image.network(item),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ))
                                    .toList(),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ": أخر المنتجات",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'fontMy',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 390,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsUserScreen(
                                            count: productmy[index].count,
                                            idProduct: productmy[index].pId,
                                            idUser: productmy[index].uId,
                                            des: productmy[index].desProduct,
                                            imageProd:
                                                productmy[index].imageProduct,
                                            lat: productmy[index].lat,
                                            long: productmy[index].long,
                                            location: productmy[index].street,
                                            name: productmy[index].nameUser,
                                            nameProd:
                                                productmy[index].nameProduct,
                                            nameres: productmy[index].nameRes,
                                            price:
                                                productmy[index].priceProduct,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 200,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  "${productmy[index].imageProduct}",
                                                  fit: BoxFit.cover,
                                                )),
                                            height: 200,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "${productmy[index].nameProduct}  : إسم المنتج ",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'fontMy',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "${productmy[index].nameRes} :  إسم المطعم",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: 'fontMy',
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              " السعر:  \$${productmy[index].priceProduct}",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: 'fontMy',
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  UserCubit.get(context)
                                                      .getFavorites(
                                                    uId: productmy[index].uId,
                                                    pId: productmy[index].pId,
                                                    nameUser: productmy[index]
                                                        .nameUser,
                                                    nameRes: productmy[index]
                                                        .nameRes,
                                                    lat: productmy[index].lat,
                                                    long: productmy[index].long,
                                                    street:
                                                        productmy[index].street,
                                                    nameProduct:
                                                        productmy[index]
                                                            .nameProduct,
                                                    priceProduct:
                                                        productmy[index]
                                                            .priceProduct,
                                                    desProduct: productmy[index]
                                                        .desProduct,
                                                    imageProduct:
                                                        productmy[index]
                                                            .imageProduct,
                                                  );
                                                },
                                                icon: UserCubit.get(context)
                                                        .fav
                                                        .contains(
                                                            productmy[index]
                                                                .uId)
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
                                                    UserCubit.get(context)
                                                        .getCart(
                                                      count: productmy[index]
                                                          .count,
                                                      uId: productmy[index].uId,
                                                      pId: productmy[index].pId,
                                                      nameUser: productmy[index]
                                                          .nameUser,
                                                      nameRes: productmy[index]
                                                          .nameRes,
                                                      lat: productmy[index].lat,
                                                      long:
                                                          productmy[index].long,
                                                      street: productmy[index]
                                                          .street,
                                                      nameProduct:
                                                          productmy[index]
                                                              .nameProduct,
                                                      priceProduct:
                                                          productmy[index]
                                                              .priceProduct,
                                                      desProduct:
                                                          productmy[index]
                                                              .desProduct,
                                                      imageProduct:
                                                          productmy[index]
                                                              .imageProduct,
                                                    );
                                                    UserCubit.get(context)
                                                        .containProd(
                                                            productmy[index]
                                                                .pId);
                                                  },
                                                  icon: Icon(
                                                      Icons.shopping_cart)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 5);
                                },
                                itemCount: productmy.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
