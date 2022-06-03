import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahmaa/Auth/Landing_Page.dart';
import 'package:rahmaa/Auth/family_product/complite_signup.dart';
import 'package:rahmaa/Auth/family_product/google_map.dart';
import 'package:rahmaa/Auth/family_product/login_famely_product.dart';
import 'package:rahmaa/Const/string_general.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Helper/savaData.dart';
import 'package:rahmaa/Screens/Family/home_layout.dart';

class SignupFamily extends StatelessWidget {
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
  @override
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
          SavaData.setDataApp(value: state.uid, key: 'loginfamily');
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
      builder: (context, state) => SafeArea(
          child: Scaffold(
        key: scaffuldState,
        backgroundColor: Color.fromARGB(255, 240, 233, 233),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage: FamilyCubit.get(context)
                                      .imageCover ==
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //TODO : user name input tybe ....

                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("User name"),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //TODO : Email input tybe .....

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text("Email")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),

                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("phone"),
                        hintText: "+966",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //TODO: password tybe input....

                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                        hintText: "",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),

                    TextFormField(
                      enabled: true,
                      keyboardType: TextInputType.none,
                      onTap: () {
                        FamilyCubit.get(context).getCurrentLocation();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => GoogleMapScreen()));
                        // ignore: unnecessary_statements
                        // scaffuldState.currentState
                        //     .showBottomSheet((context) {
                        //   return Container(
                        //     child: GoogleMap(
                        //       mapType: MapType.normal,
                        //       initialCameraPosition: _kGooglePlex,
                        //       onMapCreated:
                        //           (GoogleMapController controller) {
                        //         _controller.complete(controller);
                        //       },
                        //     ),
                        //   );
                        // }).close;
                      },
                      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Location",
                          label: Text("Location")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      controller: nameresController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("Name project"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      controller: locationController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("name street"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      controller: desController,
                      keyboardType: TextInputType.name,
                      maxLength: 300,
                      maxLines: 5,
                      decoration: InputDecoration(
                        label: Text("Descreption"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: RaisedButton(
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
                          color: Color.fromARGB(255, 241, 5, 84),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: state is SignupFamilyLoaded
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do have an account ? "),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LandingPage()),
                                  (route) => false);
                            },
                            child: Text(
                              "Login ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 241, 5, 84),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
