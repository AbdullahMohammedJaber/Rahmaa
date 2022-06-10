import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';

class FavoritesEmpty extends StatefulWidget {
  const FavoritesEmpty({Key key}) : super(key: key);

  @override
  State<FavoritesEmpty> createState() => _FavoritesEmptyState();
}

class _FavoritesEmptyState extends State<FavoritesEmpty> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(
                "The Favorits Empty !",
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
