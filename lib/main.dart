import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Auth/Landing_Page.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/Family/home_layout.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  await SavaData.init();
  String idF = await SavaData.getDataApp(key: "loginfamily");
  print(idF);
  String idU = await SavaData.getDataApp(key: "loginuser");
  print(idU);
  Widget screena;
  if (idF == null && idU == null) {
    screena = LandingPage();
  } else {
    if (idF != null) {
      screena = HomeLayout();
    } else if (idU != null) {
      return null;
    }
  }
  runApp(MyApp(
    screena: screena,
  ));
}

class MyApp extends StatelessWidget {
  final Widget screena;

  const MyApp({Key key, this.screena}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => FamilyCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: this.screena,
      ),
    );
  }
}
