import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/util/util.dart';
import 'package:intl/intl.dart';

class BookAppointmentDetails extends StatelessWidget {
  final BookAppointment bookAppointment;
  BookAppointmentDetails({@required this.bookAppointment});
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
                          DateFormat.yMMMd()
                              .add_jm()
                              .format(bookAppointment.date),
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
                    Text((bookAppointment.user.fName == null &&
                              bookAppointment.user.lName == null)
                          ? ' '
                          : (bookAppointment.user.fName +
                              '' +
                              bookAppointment.user.lName),
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
                    Text(bookAppointment.user.email),
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
                    Text(bookAppointment.user.mobile),
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
                    Text(bookAppointment.status),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comment :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(bookAppointment.comment),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'requestedDate :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '${DateFormat.yMMMd().add_jm().format(DateTime.parse(bookAppointment.requestedDate))}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'methodOfContact :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '${mapIntToMethodOfContact(bookAppointment.methodOfContact)}'),
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
