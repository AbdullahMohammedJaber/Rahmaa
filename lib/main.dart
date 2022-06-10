import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Auth/pages/login_ui_at_lesson.dart';
import 'package:rahmaa/Auth/pagesUser/loginUserScreen.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/Family/home_layout.dart';
import 'package:rahmaa/Screens/user/UserHomeLayout.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  await SavaData.init();
  String idF = await SavaData.getDataApp(key: 'loginfamily');
  print(idF);
  String idU = await SavaData.getDataApp(key: 'userlogin');
  print(idU);
  Widget screena;
  if (idF == null && idU == null) {
    screena = Lesson();
  } else {
    if (idF != null) {
      screena = HomeLayout();
    } else if (idU != null) {
      screena = UserHomeLayout();
    }
  }
  runApp(MyApp(
    screena: screena,
    id: idF,
    idU: idU,
  ));
}

class MyApp extends StatelessWidget {
  final Widget screena;
  final String id;
  final String idU;
  const MyApp({Key key, this.screena, this.id, this.idU}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        idU != null
            ? BlocProvider(
                create: (context) => UserCubit()
                  ..getAllProduct()
                  ..getDataUser(id: idU),
              )
            : BlocProvider(
                create: (context) => FamilyCubit()
                  ..getDataUser(id: id)
                  ..getMyProduct(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: this.screena,
      ),
    );
  }
}
