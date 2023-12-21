import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/sign_in/sign_in_bloc.dart';
import 'package:abs_customer_sites/application/core/sign_up/sign_up_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/skeleton/skeleton_page_admin.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/skeleton_page/skeleton_page.dart';

final signUpFormKey = GlobalKey<FormState>();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String role = 'Role';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => getIt<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            'Sign Up',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child:
              BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
            SignUpFormState currentState = state as SignUpFormState;
            if (currentState.authResult == AuthResult.success) {
              if (currentState.role == UserRole.admin) {
                Get.to(SkeletonPageAdmin());
              } else {
                Get.to(SkeletonPageDealership());
              }
            }
          }, builder: (context, state) {
            SignUpFormState currentState = state as SignUpFormState;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: signUpFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'User name',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validateUserName(value);
                            },
                            onChanged: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .add(SignUpUserNameChanged(userName: value));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'First Name',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validateFirstName(value);
                            },
                            onChanged: (value) {
                              return context.read<SignUpBloc>().add(
                                  SignUpFirstNameChanged(firstName: value));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validateLastName(value);
                            },
                            onChanged: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .add(SignUpLastNameChanged(lastName: value));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validateEmail(value);
                            },
                            onChanged: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .add(SignUpEmailChanged(email: value));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validatePassword(value);
                            },
                            onChanged: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .add(SignUpPasswordChanged(password: value));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Mobile',
                            ),
                            validator: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .validateMobile(value);
                            },
                            onChanged: (value) {
                              return context
                                  .read<SignUpBloc>()
                                  .add(SignUpMobileChanged(mobile: value));
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ExpansionTile(
                            key: GlobalKey(),
                            title: Text(context
                                .read<SignUpBloc>()
                                .getRole(currentState.role)),
                            children: [
                              ListTile(
                                title: Text('Admin'),
                                onTap: () {
                                  return context.read<SignUpBloc>().add(
                                      SignUpRoleChanged(role: UserRole.admin));
                                },
                              ),
                              ListTile(
                                title: Text('Dealership Manager'),
                                onTap: () {
                                  return context.read<SignUpBloc>().add(
                                      SignUpRoleChanged(
                                          role: UserRole.dealership));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.read<SignUpBloc>().validateRole(),
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        return context
                            .read<SignUpBloc>()
                            .add(SignUpButtonPeressd());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
