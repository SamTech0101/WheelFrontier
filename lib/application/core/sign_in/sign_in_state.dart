part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInFormState extends SignInState {
  final String email;
  final String password;
  final bool shouldShowErrorMessages;
  final bool waitingForApiResponse;
  final bool hasEnabledFingerprint;
  final AuthResult authResult;
  final UserRole userRole;
  final User user;

  SignInFormState({
    @required this.email,
    @required this.password,
    @required this.shouldShowErrorMessages,
    @required this.waitingForApiResponse,
    @required this.hasEnabledFingerprint,
    @required this.authResult,
    @required this.userRole,
    this.user,
  });

  factory SignInFormState.initial() => SignInFormState(
        email: '',
        password: '',
        shouldShowErrorMessages: false,
        waitingForApiResponse: false,
        hasEnabledFingerprint: false,
        authResult: AuthResult.none,
        userRole: UserRole.undefined,
        user: null,
      );

  SignInFormState copyWith({
    String email,
    String password,
    bool shouldShowErrorMessages,
    bool waitingForApiResponse,
    bool hasEnabledFingerprint,
    AuthResult authResult,
    UserRole userRole,
    User user,
  }) {
    return SignInFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        shouldShowErrorMessages:
            shouldShowErrorMessages ?? this.shouldShowErrorMessages,
        waitingForApiResponse:
            waitingForApiResponse ?? this.waitingForApiResponse,
        hasEnabledFingerprint:
            hasEnabledFingerprint ?? this.hasEnabledFingerprint,
        authResult: authResult ?? this.authResult,
        userRole: userRole ?? this.userRole,
        user: user);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInFormState &&
        other.email == email &&
        other.password == password &&
        other.shouldShowErrorMessages == shouldShowErrorMessages &&
        other.waitingForApiResponse == waitingForApiResponse &&
        other.hasEnabledFingerprint == hasEnabledFingerprint &&
        other.authResult == authResult &&
        other.userRole == userRole &&
        other.user == user;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        shouldShowErrorMessages.hashCode ^
        waitingForApiResponse.hashCode ^
        hasEnabledFingerprint.hashCode ^
        authResult.hashCode ^
        userRole.hashCode ^
        user.hashCode;
  }
}

enum AuthResult {
  success,
  failure,
  none,
}

enum UserRole {
  admin,
  dealership,
  undefined,
}
