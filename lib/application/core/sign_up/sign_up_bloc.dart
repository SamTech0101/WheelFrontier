import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abs_customer_sites/application/core/sign_in/sign_in_bloc.dart';
import 'package:abs_customer_sites/presentation/core/sign_up_page/sign_up_page.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

// this file is reduntatnt and should be deleted

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpFormState.initial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    SignUpFormState currentState = state as SignUpFormState;
    if (event is SignUpUserNameChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(userName: event.userName);
    } else if (event is SignUpFirstNameChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(firstName: event.firstName);
    } else if (event is SignUpLastNameChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(lastName: event.lastName);
    } else if (event is SignUpEmailChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(email: event.email);
    } else if (event is SignUpPasswordChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(password: event.password);
    } else if (event is SignUpMobileChanged) {
      if (currentState.shouldShowErrorMessages) {
        signUpFormKey.currentState.validate();
      }
      yield currentState.copyWith(mobile: event.mobile);
    } else if (event is SignUpRoleChanged) {
      if (currentState.shouldShowErrorMessages) {}
      yield currentState.copyWith(role: event.role);
    } else if (event is SignUpButtonPeressd) {
      AuthResult authResult;
      if (validateEmail(currentState.email) == null &&
          validatePassword(currentState.password) == null &&
          validateFirstName(currentState.firstName) == null &&
          validateLastName(currentState.lastName) == null &&
          validateMobile(currentState.mobile) == null &&
          validateUserName(currentState.userName) == null &&
          validateRole() == '') {
        authResult = AuthResult.success;
      } else {
        authResult = AuthResult.failure;
      }
      signUpFormKey.currentState.validate();
      yield currentState.copyWith(
        shouldShowErrorMessages: true,
        authResult: authResult,
      );
    }
  }

  validatePassword(String password) {
    if (password.length < 6) {
      return 'Passwords must be at least 6 characters';
    }
    return null;
  }

  validateEmail(String email) {
    if (RegExp(
            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
        .hasMatch(email)) {
      return null;
    }
    return 'Inavalid Email';
  }

  validateUserName(String userName) {
    if (userName == '') {
      return 'please complete username field';
    }
    return null;
  }

  validateFirstName(String firstName) {
    if (firstName == '') {
      return 'please add your Firstname';
    }
    return null;
  }

  validateLastName(String lastName) {
    if (lastName == '') {
      return 'please add your Lastname';
    }
    return null;
  }

  validateMobile(String mobile) {
    if (mobile == '') {
      return 'please add your mobile number';
    }
    return null;
  }

  String validateRole() {
    SignUpFormState currentState = state as SignUpFormState;
    if (currentState.role == UserRole.undefined &&
        currentState.shouldShowErrorMessages) {
      return 'Please Select Role';
    } else {
      return '';
    }
  }

  getRole(UserRole role) {
    if (role == UserRole.admin) {
      return 'Admin';
    } else if (role == UserRole.dealership) {
      return 'Dealership';
    } else {
      return 'Select your Role';
    }
  }
}
