part of 'family_cubit.dart';

@immutable
abstract class FamilyState {}

class FamilyInitial extends FamilyState {}

class LoginFamilySuccessfuly extends FamilyState {
  final String uid;

  LoginFamilySuccessfuly(this.uid);
}

class LoginFamilyError extends FamilyState {}

class LoginFamilyLoaded extends FamilyState {}

class SignupFamilySuccessfuly extends FamilyState {
  final String uid;

  SignupFamilySuccessfuly(this.uid);
}

class SignupFamilyError extends FamilyState {}

class SignupFamilyLoaded extends FamilyState {}

class CreateUserFireStoreFamilyStateLoaded extends FamilyState {}

class CreateUserFireStoreFamilyStateError extends FamilyState {}

class CreateUserFireStoreFamilyStateSuccessfully extends FamilyState {}

class GetCurrentPossetionLoacationSuccesfully extends FamilyState {}

class GetCurrentPossetionLoacationError extends FamilyState {}

class GetCurrentPossetionLoacationLoaded extends FamilyState {}

class AddPhotoFamilySuccessfully extends FamilyState {}

class AddPhotoFamilyError extends FamilyState {}

class GetDataUserSuccessfully extends FamilyState {}

class GetDataUserError extends FamilyState {}

class ChangedBottomBar extends FamilyState {}

class GetDataProductMySuccessfully extends FamilyState {}

class GetDataProductAllSuccessfully extends FamilyState {}

class DeleteProductisSuccessfully extends FamilyState {}

class SignoutFamilySuccessfully extends FamilyState {}

class SignoutFamilyLoaded extends FamilyState {}
