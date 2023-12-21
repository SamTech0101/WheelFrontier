part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInPageInitialized extends SignInEvent {}

class SignInEmailChanged extends SignInEvent {
  final String email;

  SignInEmailChanged({@required this.email});
}

class SignInPasswordChanged extends SignInEvent {
  final String password;

  SignInPasswordChanged({@required this.password});
}

class SignInButtonPressed extends SignInEvent {}

class SignInWithBiometricButtonPressed extends SignInEvent {}
