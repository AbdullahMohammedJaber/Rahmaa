import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rahmaa/Auth/pagesUser/signupUserScreen.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/user/UserHomeLayout.dart';

class LoginUserScreen extends StatelessWidget {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoginUserStateSuccessfully) {
          Fluttertoast.showToast(
              msg: "تم تسجيل الدخول بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          SavaData.setDataApp(key: 'userlogin', value: state.uid);
          UserCubit.get(context).getDataUser(id: state.uid);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => UserHomeLayout()),
              (route) => false);
        } else if (state is LoginUserStateError) {
          Fluttertoast.showToast(
              msg: "لم يتم تسجيل الدخول ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        body: Stack(
          children: <Widget>[
            Positioned(
              right: -getSmallDiameter(context) / 3,
              top: -getSmallDiameter(context) / 3,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 77, 67, 228),
                          Color.fromARGB(255, 83, 72, 231),
                          Color.fromARGB(255, 32, 34, 146),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Positioned(
              left: -getBiglDiameter(context) / 4,
              top: -getBiglDiameter(context) / 4,
              child: Container(
                child: const Center(
                  child: Text(
                    "رحمة",
                    style: TextStyle(
                        fontFamily: "rahma",
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                width: getBiglDiameter(context),
                height: getBiglDiameter(context),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 77, 67, 228),
                          Color.fromARGB(255, 83, 72, 231),
                          Color.fromARGB(255, 32, 34, 146),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Positioned(
              right: -getBiglDiameter(context) / 2,
              bottom: -getBiglDiameter(context) / 2,
              child: Container(
                width: getBiglDiameter(context),
                height: getBiglDiameter(context),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 65, 47, 230)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                          cursorColor: Colors.blue,
                          textAlign: TextAlign.end,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "البريد الإلكتروني",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 10, 9, 9),
                                fontFamily: 'fontMy'),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                          cursorColor: Colors.blue,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "كلمة المرور",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 10, 9, 9),
                                fontFamily: 'fontMy'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 45,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                splashColor: Colors.amber,
                                onTap: () {
                                  UserCubit.get(context).loginUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                                },
                                child: Center(
                                  child: state is LoginUserStateLoaded
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          "دخول",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'fontMy',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 77, 67, 228),
                                      Color.fromARGB(255, 83, 72, 231),
                                      Color.fromARGB(255, 32, 34, 146),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignupUserScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "إنشاء حساب",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                              fontFamily: 'fontMy',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "  لا تملك حساب ؟  ",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 51, 50, 50),
                          fontFamily: 'fontMy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
