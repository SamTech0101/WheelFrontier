import 'package:flutter/material.dart';

const Demo_Request = 'Demo Request';
const Contact_Us_Request = 'Contact Us';
const Registration_Request = 'Registration';

abstract class Request {
  final DateTime date;
  final String status;
  final String requestType;

  Request({
    @required this.date,
    @required this.status,
    @required this.requestType,
  });
}

// enum RequestType { demo, contactUs }
