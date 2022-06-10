import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';

class CartsEmpty extends StatefulWidget {
  const CartsEmpty({Key key}) : super(key: key);

  @override
  State<CartsEmpty> createState() => _CartsEmptyState();
}

class _CartsEmptyState extends State<CartsEmpty> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(
                "The Cart is Empty !",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
