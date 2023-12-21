part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpRoleChanged extends SignUpEvent {
  final UserRole role;
  SignUpRoleChanged({this.role});
}

class SignUpUserNameChanged extends SignUpEvent {
  final String userName;
  SignUpUserNameChanged({this.userName});
}

class SignUpFirstNameChanged extends SignUpEvent {
  final String firstName;
  SignUpFirstNameChanged({this.firstName});
}

class SignUpLastNameChanged extends SignUpEvent {
  final String lastName;
  SignUpLastNameChanged({this.lastName});
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  SignUpEmailChanged({this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged({this.password});
}

class SignUpMobileChanged extends SignUpEvent {
  final String mobile;
  SignUpMobileChanged({this.mobile});
}

class SignUpButtonPeressd extends SignUpEvent {}
