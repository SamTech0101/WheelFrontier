part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpFormState extends SignUpState {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String mobile;
  final bool shouldShowErrorMessages;
  final AuthResult authResult;
  final UserRole role;

  SignUpFormState({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.mobile,
    this.shouldShowErrorMessages,
    this.authResult,
    this.role,
  });

  factory SignUpFormState.initial() => SignUpFormState(
        userName: '',
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        mobile: '',
        shouldShowErrorMessages: false,
        authResult: AuthResult.none,
        role: UserRole.undefined,
      );

  SignUpFormState copyWith({
    String userName,
    String firstName,
    String lastName,
    String email,
    String password,
    String mobile,
    bool shouldShowErrorMessages,
    AuthResult authResult,
    UserRole role,
  }) {
    return SignUpFormState(
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      shouldShowErrorMessages:
          shouldShowErrorMessages ?? this.shouldShowErrorMessages,
      authResult: authResult ?? this.authResult,
      role: role ?? this.role,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SignUpFormState &&
        o.userName == userName &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.email == email &&
        o.password == password &&
        o.mobile == mobile &&
        o.shouldShowErrorMessages == shouldShowErrorMessages &&
        o.authResult == authResult &&
        o.role == role;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        shouldShowErrorMessages.hashCode ^
        authResult.hashCode ^
        role.hashCode;
  }
}
