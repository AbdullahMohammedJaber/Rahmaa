import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rahmaa/Auth/pages/sign_up_assignment.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/Family/home_layout.dart';

class Lesson extends StatelessWidget {
  void fireToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void fireToast2(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade900,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {
        if (state is LoginFamilySuccessfuly) {
          Fluttertoast.showToast(
              msg: "The Login up is Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          FamilyCubit.get(context).getDataUser(id: state.uid);
          SavaData.setDataApp(key: 'loginfamily', value: state.uid);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomeLayout()),
              (route) => false);
        } else if (state is LoginFamilyError) {
          Fluttertoast.showToast(
              msg: "The Login is not Complite",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade900,
                Colors.green,
                Colors.green.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Form(
            child: Column(
              children: [
                /// Login & Welcome back
                Container(
                  height: 210,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      /// LOGIN TEXT
                      Text('Login',
                          style:
                              TextStyle(color: Colors.white, fontSize: 32.5)),
                      SizedBox(height: 7.5),

                      /// WELCOME
                      Text('Welcome Back',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        const SizedBox(height: 60),

                        /// Text Fields
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 20,
                                    spreadRadius: 10,
                                    offset: const Offset(0, 10)),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /// EMAIL
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    isCollapsed: false,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                              Divider(color: Colors.black54, height: 1),

                              /// PASSWORD
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    isCollapsed: false,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),

                        /// LOGIN BUTTON
                        MaterialButton(
                          onPressed: () {
                            FamilyCubit.get(context).loginFamily(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          height: 45,
                          minWidth: 240,
                          child: state is LoginFamilyLoaded
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                          textColor: Colors.white,
                          color: Colors.green.shade700,
                          shape: const StadiumBorder(),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t have an account ? "),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Assignment();
                                  },
                                ), (route) => false);
                              },
                              child: Text(
                                "Sign up ",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'By logging in you are agree with our',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Terms & Conditions ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.cyan),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Hash tag #tag');
                                        fireToast2(
                                            "Terms & Conditions Hash Tag");
                                      }),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.cyan),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Hash tag #tag');
                                        fireToast2("Privacy Policy Hash Tag");
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
