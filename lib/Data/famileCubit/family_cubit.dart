import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rahmaa/Model/FamileProductionModel/location_model.dart';
import 'package:rahmaa/Model/FamileProductionModel/user_model.dart';
import 'package:rahmaa/Screens/Family/home.dart';
import 'package:rahmaa/Screens/Family/profileFamily.dart';
import 'package:rahmaa/Screens/Family/uploadFamily.dart';

part 'family_state.dart';

class FamilyCubit extends Cubit<FamilyState> {
  FamilyCubit() : super(FamilyInitial());
  static FamilyCubit get(context) => BlocProvider.of(context);
  Position currentLocation;
  LocationModel loca;
  static String uIdFamily;
  FamilyUserModel userModel;
  var currentIndex = 0;
  void loginFamily({
    @required String email,
    @required String password,
  }) {
    emit(LoginFamilyLoaded());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      uIdFamily = value.user.uid;
      emit(LoginFamilySuccessfuly(uIdFamily));
    }).catchError((onError) {
      emit(LoginFamilyError());
    });
  }

  File imageCover;
  final picker = ImagePicker();
  Future getImageCover() async {
    final pickedFileCover = await picker.getImage(source: ImageSource.gallery);

    if (pickedFileCover != null) {
      imageCover = File(pickedFileCover.path);
      emit(AddPhotoFamilySuccessfully());
    } else {
      print('No image selected.');
      emit(AddPhotoFamilyError());
    }
  }

  void signupFamily({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
    @required String des,
    String image,
    @required String nameres,
    @required String street,
  }) async {
    emit(SignupFamilyLoaded());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      uIdFamily = value.user.uid;
      emit(SignupFamilySuccessfuly(uIdFamily));
      final ref =
          FirebaseStorage.instance.ref().child('userImage').child('$name.jpg');
      await ref.putFile(imageCover).then((p0) {
        p0.ref.getDownloadURL().then((value) {
          emit(CreateUserFireStoreFamilyStateLoaded());
          userModel = new FamilyUserModel(
            des: des,
            image: value,
            nameres: nameres,
            street: street,
            id: uIdFamily,
            name: name,
            email: email,
            phone: phone,
            password: password,
            lat: loca.lat,
            long: loca.long,
          );
          FirebaseFirestore.instance
              .collection("family")
              .doc(uIdFamily)
              .set(userModel.toMap())
              .then((value) {
            emit(CreateUserFireStoreFamilyStateSuccessfully());
          }).catchError((onError) {
            print(onError.toString());
            emit(CreateUserFireStoreFamilyStateError());
          });
        });
      });
    }).catchError((onError) {
      emit(SignupFamilyError());
    });
  }

  void createUser({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
    @required String id,
    @required String des,
    @required String image,
    @required String nameres,
    @required String street,
  }) async {
    emit(CreateUserFireStoreFamilyStateLoaded());

    final ref =
        FirebaseStorage.instance.ref().child('productsImages').child('.jpg');
    await ref.putFile(imageCover).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        userModel = new FamilyUserModel(
          des: des,
          image: value,
          nameres: nameres,
          street: street,
          id: id,
          name: name,
          email: email,
          phone: phone,
          password: password,
          lat: loca.lat,
          long: loca.long,
        );
      });
    });
    FirebaseFirestore.instance
        .collection("family")
        .doc(id)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserFireStoreFamilyStateSuccessfully());
    }).catchError((onError) {
      print(onError.toString());
      emit(CreateUserFireStoreFamilyStateError());
    });
  }

  Future<Position> getCurrentLocation() async {
    emit(GetCurrentPossetionLoacationLoaded());
    return currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      // ignore: missing_return
    ).then((value) {
      loca = new LocationModel(
        lat: value.latitude,
        long: value.longitude,
      );
      print("the current location is : ${currentLocation}");
      print("the lat , long is : ${value.latitude} + ${value.longitude}");

      emit(GetCurrentPossetionLoacationSuccesfully());
    }).catchError((onError) {
      emit(GetCurrentPossetionLoacationError());
    });
  }

  List<FamilyUserModel> userFamily;
  void getDataUser() {
    FirebaseFirestore.instance
        .collection("family")
        .doc(uIdFamily)
        .get()
        .then((value) {
      print(value.data());

      userFamily.add(FamilyUserModel.fromJson(value.data()));
      emit(GetDataUserSuccessfully());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetDataUserError());
    });
  }

  List<Widget> screens = [
    HomeFamily(),
    UploadFamily(),
    ProfileFamily(),
  ];
  void changeBottomBar(index) {
    currentIndex = index;
    emit(ChangedBottomBar());
  }
}
