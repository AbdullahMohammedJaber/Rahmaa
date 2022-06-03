import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rahmaa/Model/UserModel/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
  static String uIdGlobal;
  UserModel userModel;
  // ignore: todo
  //TODO : void login user ......
  void loginUser({
    @required String email,
    @required String password,
  }) {
    emit(LoginUserStateLoaded());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uIdGlobal = value.user.uid;
      emit(LoginUserStateSuccessfully(
        uid: uIdGlobal,
      ));
    }).catchError((onError) {
      emit(LoginUserStateError());
    });
  }
  // ignore: todo
  // TODO : Signup user ....

  void signUpUser({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
  }) {
    emit(SignupUserStateLoaded());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uIdGlobal = value.user.uid;
      emit(SignupUserStateSuccessfully(
        uid: uIdGlobal,
      ));
      createUser(
        id: value.user.uid,
        email: email,
        name: name,
        phone: phone,
        password: password,
      );
    }).catchError((onError) {
      print(onError.toString());
      emit(SignupUserStateError());
    });
  }

  // ignore: todo
  //TODO : creat user in fireStore Firebase ...
  void createUser({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
    @required String id,
  }) {
    emit(CreateUserFireStoreUserStateLoaded());
    userModel = new UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserFireStoreUserStateSuccessfully());
    }).catchError((onError) {
      print(onError.toString());
      emit(CreateUserFireStoreUserStateError());
    });
  }
}
