import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "Wellcome Back",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              Icon(
                Icons.notifications_active,
                color: Colors.black,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
            ],
          ),
          body: FamilyCubit.get(context)
              .screens[FamilyCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: FamilyCubit.get(context).currentIndex,
            elevation: 10,
            onTap: (index) {
              FamilyCubit.get(context).changeBottomBar(index);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "upload",
                icon: Icon(Icons.upload_rounded),
              ),
              BottomNavigationBarItem(
                label: "profile",
                icon: Icon(Icons.person_sharp),
              ),
            ],
          ),
        );
      },
    );
  }
}
