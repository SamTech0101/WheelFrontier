import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/domain/admin-panel/requests/contact_us/contact_us.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us.dart';
import 'package:intl/intl.dart';

class ContactUsDealershipDetails extends StatelessWidget {
  final ContactUsDealership contactUsDealership;
  ContactUsDealershipDetails({@required this.contactUsDealership});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Request Details',
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
          child: Column(
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
                          DateFormat.yMMMd().format(contactUsDealership.date),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (contactUsDealership.user.fName == null &&
                              contactUsDealership.user.lName == null)
                          ? ' '
                          : (contactUsDealership.user.fName +
                              '' +
                              contactUsDealership.user.lName),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(contactUsDealership.user.email),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(contactUsDealership.user.mobile),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(contactUsDealership.status),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Message :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(contactUsDealership.message),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
