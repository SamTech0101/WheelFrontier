import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/global_bloc/global_bloc_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/data/core/secure_storage.dart';
import 'package:abs_customer_sites/domain/core/auth/auth_service.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/presentation/core/sign_in_page/sign_in_page.dart';
import 'package:abs_customer_sites/presentation/core/widgets/add_biometric_auth_dialog.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GlobalBloc globalBloc;
  final AuthService authService;
  final SecureStorage secureStorage;
  SignInBloc({
    @required this.globalBloc,
    @required this.authService,
    @required this.secureStorage,
  }) : super(SignInFormState.initial());

  Map<String, dynamic> _savedSignInData;

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    SignInFormState currentState = state as SignInFormState;
    if (event is SignInPageInitialized) {
      // we only save user sign in data to secure storage when user wants to
      // enable fingerprint authentication so when the signindata from secure storage
      // isnt null it does mean that user has eanbled fingerprint authentication
      _savedSignInData = await secureStorage.read('user');
      if (_savedSignInData != null) {
        yield currentState.copyWith(
          hasEnabledFingerprint: true,
        );
      }
    } else if (event is SignInEmailChanged) {
      if (currentState.shouldShowErrorMessages) {
        signInFormKey.currentState.validate();
      }
      yield currentState.copyWith(email: event.email);
    } else if (event is SignInPasswordChanged) {
      if (currentState.shouldShowErrorMessages) {
        signInFormKey.currentState.validate();
      }
      yield currentState.copyWith(password: event.password);
    } else if (event is SignInButtonPressed) {
      signInFormKey.currentState.validate();
      // validate email returns null  when it is valid
      if (validateEmail(currentState.email) == null &&
          validatePassword(currentState.password) == null) {
        try {
          yield currentState.copyWith(waitingForApiResponse: true);
          String token = await authService.signIn(
              currentState.email, currentState.password);
          // sending the token to global bloc for updating the token and authroization
          // header in dio
          globalBloc.add(AuthTokenChanged(authToken: token));

          // delaying for some time to make suer global bloc state gets updated
          await Future.delayed(Duration(milliseconds: 50));
          UserRole userRole = UserRole.undefined;
          User user = await authService.getUserInfo();
          globalBloc.add(UserUpdated(user: user));
          getIt.registerSingleton<User>(user);

          if (_savedSignInData == null) {
            bool addBiometricAuth = await addBiometricAuthDialog();
            // save sign in data for user if he wants biometric authentication
            if (addBiometricAuth) {
              Map<String, dynamic> signInData = {
                'email': currentState.email,
                'password': currentState.password
              };
              await secureStorage.write('user', signInData);
            }
          }
          // number three is for dealership and number one is for admin
          if (user.frkRole == 3) {
            userRole = UserRole.dealership;
          } else if (user.frkRole == 1) {
            userRole = UserRole.admin;
          }
          yield currentState.copyWith(
            authResult: AuthResult.success,
            waitingForApiResponse: false,
            userRole: userRole,
            shouldShowErrorMessages: true,
          );
        } catch (e) {
          yield currentState.copyWith(waitingForApiResponse: false);
          Get.snackbar(
            'Couldnt sign you in',
            e.toString(),
            backgroundColor: Colors.blue[50],
          );
        }
      }
    } else if (event is SignInWithBiometricButtonPressed) {
      LocalAuthentication localAuth = LocalAuthentication();
      try {
        bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Please authenticate to login to your account',
          biometricOnly: true,
        );
        if (didAuthenticate) {
          yield currentState.copyWith(waitingForApiResponse: true);
          await authService.signIn(
            _savedSignInData['email'],
            _savedSignInData['password'],
          );
          UserRole userRole = UserRole.undefined;
          User user = await authService.getUserInfo();
          if (user.frkRole == 3) {
            userRole = UserRole.dealership;
          } else if (user.frkRole == 1) {
            userRole = UserRole.admin;
          }
          yield currentState.copyWith(
            authResult: AuthResult.success,
            waitingForApiResponse: false,
            userRole: userRole,
            shouldShowErrorMessages: true,
          );
        }
      } catch (e) {
        Get.snackbar('Couldnt sign you in', e.toString(),
            backgroundColor: Colors.blue[50]);
      }
    }
  }

  validateEmail(String email) {
    // if (RegExp(
    //         r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
    //     .hasMatch(email)) {
    //   return null;
    // }
    // return 'Invalid Email';
    return null;
  }

  validatePassword(String password) {
    if (password.length < 6) {
      return 'Passwords must be at least 6 characters';
    }
    return null;
  }
}
