import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Screens/user/cart/cart_screen.dart';
import 'package:rahmaa/Screens/user/favorites/favoraits_empty.dart';
import 'package:rahmaa/Screens/user/favorites/favorites.dart';

class UserHomeLayout extends StatelessWidget {
  const UserHomeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "أهلا وسهلا ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'fontMy',
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white38,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Favorietes()));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    UserCubit.get(context).fav.length == null
                        ? Text(
                            "0",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Text(
                            "${UserCubit.get(context).fav.length}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              backgroundColor: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CircleAvatar(
                backgroundColor: Colors.white38,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Carts()));
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),
                    UserCubit.get(context).cat.length == null
                        ? Text(
                            "0",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Text(
                            "${UserCubit.get(context).cat.length}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              backgroundColor: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
          body: UserCubit.get(context)
              .screensUser[UserCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: UserCubit.get(context).currentIndex,
            elevation: 10,
            onTap: (index) {
              UserCubit.get(context).changeBottomBar(index);
            },
            items: [
              BottomNavigationBarItem(
                label: "الرئيسية",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "المنتجات",
                icon: Icon(Icons.category_rounded),
              ),
              BottomNavigationBarItem(
                label: "بروفايل",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
