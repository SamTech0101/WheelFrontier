import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/requests_page/requests_page_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';
import 'package:intl/intl.dart';

class SignUpRequestDetailPage extends StatelessWidget {
  final SignUpRequest signUpRequest;

  SignUpRequestDetailPage({@required this.signUpRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Sign Up Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: BlocBuilder<RequestsPageBloc, RequestsPageState>(
              bloc: getIt<RequestsPageBloc>(),
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat.yMMMd()
                                    .format(signUpRequest.createdAt),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Business Name :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(signUpRequest.bussinessName),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Website :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(signUpRequest.businessWebsite),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Primary Phone :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(signUpRequest.primaryPhoneNumber),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Owner Phone :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(signUpRequest.ownerPhoneNumber),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                getIt<RequestsPageBloc>().add(
                                    SingUpRequestRejectButonPressed(
                                        signUpRequest: signUpRequest));
                              },
                              color: Colors.red,
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                getIt<RequestsPageBloc>().add(
                                    SingUpRequestAcceptButtonPressed(
                                        signUpRequest: signUpRequest));
                              },
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
