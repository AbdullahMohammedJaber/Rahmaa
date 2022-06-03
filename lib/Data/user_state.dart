part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

//TODO : Login Screen
class LoginUserStateSuccessfully extends UserState {
  final String uid;

  LoginUserStateSuccessfully({@required this.uid});
}

class LoginUserStateError extends UserState {}

class LoginUserStateLoaded extends UserState {}

//TODO : Signup Screen
class SignupUserStateSuccessfully extends UserState {
  final String uid;

  SignupUserStateSuccessfully({@required this.uid});
}

class SignupUserStateError extends UserState {}

class SignupUserStateLoaded extends UserState {}

//TODO : add FireStore User Model ...
class CreateUserFireStoreUserStateSuccessfully extends UserState {}

class CreateUserFireStoreUserStateError extends UserState {}

class CreateUserFireStoreUserStateLoaded extends UserState {}
