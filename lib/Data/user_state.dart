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

// ignore: todo
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

class ChangedBottomBarUser extends UserState {}

class AddFavoraitesSucessfully extends UserState {}

class RemofeFavoreitesSuccessfully extends UserState {}

class ClrearDone extends UserState {}

class GetDataProductAllSuccessfully extends UserState {}

class GetDataUserSuccessfully extends UserState {}

class AddCartSucessfully extends UserState {}

class RemofeCartSuccessfully extends UserState {}

class ClrearCatDone extends UserState {}

class FoundCat extends UserState {}

class UserCartGetTotalPrice extends UserState {}

class minusCountProduct extends UserState {}

class maxCountProduct extends UserState {}

class TeacherChangeDrobButtonSuccessfullu extends UserState {}
