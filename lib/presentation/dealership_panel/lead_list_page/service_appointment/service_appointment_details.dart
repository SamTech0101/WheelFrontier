import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment.dart';
import 'package:intl/intl.dart';

class ServiceAppointmentDetails extends StatelessWidget {
  final ServiceAppointment serviceAppointment;
  ServiceAppointmentDetails({@required this.serviceAppointment});
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
                              .format(serviceAppointment.date),
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
                    Text((serviceAppointment.user.fName == null &&
                              serviceAppointment.user.lName == null)
                          ? ' '
                          : (serviceAppointment.user.fName +
                              '' +
                              serviceAppointment.user.lName),
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
                    Text(serviceAppointment.user.email),
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
                    Text(serviceAppointment.user.mobile),
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
                    Text(serviceAppointment.status),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order No :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(serviceAppointment.orderNO),
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
                    Text(serviceAppointment.comment),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Requested Date :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${DateFormat.yMMMd().add_jm().format(
                          DateTime.parse(serviceAppointment.requestedDate),
                        )}'),
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
