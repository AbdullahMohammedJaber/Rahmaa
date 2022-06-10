import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Screens/user/cart/cart_empty.dart';
import 'package:rahmaa/Screens/user/cart/cart_full.dart';
import 'package:rahmaa/Screens/user/favorites/favoraits_empty.dart';
import 'package:rahmaa/Screens/user/favorites/favorites_full.dart';

class Carts extends StatelessWidget {
  const Carts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return UserCubit.get(context).cat.length == 0
            ? CartsEmpty()
            : CartsFull();
      },
      listener: (context, state) {},
    );
  }
}
