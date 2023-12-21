import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/sign_in/sign_in_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/skeleton/skeleton_page_admin.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/skeleton_page/skeleton_page.dart';
import 'package:loading_overlay/loading_overlay.dart';

final signInFormKey = GlobalKey<FormState>();

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => getIt<SignInBloc>()..add(SignInPageInitialized()),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          SignInFormState currentState = state as SignInFormState;
          if (currentState.authResult == AuthResult.success) {
            if (currentState.userRole == UserRole.admin) {
              Get.offAll(
                SkeletonPageAdmin(),
              );
            } else if (currentState.userRole == UserRole.dealership) {
              Get.offAll(
                SkeletonPageDealership(),
              );
            }
          }
        },
        builder: (context, state) {
          SignInFormState currentState = state as SignInFormState;
          return LoadingOverlay(
            isLoading: currentState.waitingForApiResponse,
            color: Colors.blueAccent[100].withOpacity(0.4),
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).accentColor,
                title: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 22),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Form(
                    key: signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            return context
                                .read<SignInBloc>()
                                .validateEmail(value);
                          },
                          onChanged: (value) {
                            context
                                .read<SignInBloc>()
                                .add(SignInEmailChanged(email: value));
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            return context
                                .read<SignInBloc>()
                                .validatePassword(value);
                          },
                          onChanged: (value) {
                            context
                                .read<SignInBloc>()
                                .add(SignInPasswordChanged(password: value));
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();

                                context
                                    .read<SignInBloc>()
                                    .add(SignInButtonPressed());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        currentState.hasEnabledFingerprint
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      context.read<SignInBloc>().add(
                                          SignInWithBiometricButtonPressed());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Sign In with',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.fingerprint_outlined,
                                                size: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
