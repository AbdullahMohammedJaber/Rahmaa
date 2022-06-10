import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahmaa/Auth/family_product/google_map.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/Family/home_layout.dart';

class Assignment extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var locationController = TextEditingController();
    var desController = TextEditingController();
    var nameresController = TextEditingController();

    var scaffuldState = new GlobalKey<ScaffoldState>();
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {
        if (state is SignupFamilySuccessfuly) {
          Fluttertoast.showToast(
              msg: "The Sign up is Successfully",
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
        } else if (state is SignupFamilyError) {
          Fluttertoast.showToast(
              msg: "The Sign up is not Complited",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color(0xff424242),
                    Color(0xff5c5c5c),
                    Color(0xff7d7d7d),
                  ])),
              child: Column(
                children: [
                  /// Sign up & Welcome
                  Container(
                      padding:
                          const EdgeInsets.only(top: 80, bottom: 0, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Welcome',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      )),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: FamilyCubit.get(context).imageCover ==
                                null
                            ? AssetImage("assets/images/logo.jpeg")
                            : FileImage(FamilyCubit.get(context).imageCover),
                        radius: 70,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 21,
                      ),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            FamilyCubit.get(context).getImageCover();
                          },
                          hoverColor: Colors.red,
                          icon: Icon(Icons.camera_alt_outlined),
                        ),
                        radius: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /// The rest
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      padding:
                          const EdgeInsets.only(top: 50, right: 15, left: 15),
                      child: SingleChildScrollView(
                        child: Form(
                          child: Column(
                            children: [
                              /// Text Fields
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          blurRadius: 20,
                                          spreadRadius: 5,
                                          offset: const Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Fullname',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Phone',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        FamilyCubit.get(context)
                                            .getCurrentLocation();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    GoogleMapScreen()));
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'location',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: nameresController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'name project',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: locationController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'location *',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: desController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Description',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),

                              /// Sign Up
                              MaterialButton(
                                shape: const StadiumBorder(),
                                minWidth: 230,
                                height: 45,
                                color: const Color(0xff616161),
                                child: state is SignupFamilyLoaded
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'SignUp',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                onPressed: () {
                                  if (FamilyCubit.get(context).loca == null) {
                                    Fluttertoast.showToast(
                                        msg: "The Location is null",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    print(desController.text);
                                    FamilyCubit.get(context).signupFamily(
                                      des: desController.text,
                                      street: locationController.text,
                                      nameres: nameresController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      name: nameController.text,
                                    );
                                  }
                                },
                              ),

                              /// Facebook/Google/Apple
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
