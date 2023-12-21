import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/domain/core/util/util.dart';

class BookAppointment {
  int id;
  int methodOfContact;
  String requestedDate;
  String comment;
  String status;
  DateTime date;
  String updatedAt;
  int frkUserId;
  User user;
  String apiType;

  BookAppointment(
      {this.id,
      this.methodOfContact,
      this.requestedDate,
      this.comment,
      this.status,
      this.date,
      this.updatedAt,
      this.frkUserId,
      this.user,
      this.apiType});

  BookAppointment.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    methodOfContact = json['method_of_contact'];
    requestedDate = json['requested_date'];
    comment = json['comment'];
    status = mapintToStatus(json['status']);
    date = DateTime.parse(json['createdAt']);
    updatedAt = json['updatedAt'];
    frkUserId = json['frk_user_id'];
    user = json['User'] != null ? new User.fromMap(json['User']) : null;
    apiType = json['apiType'];
  }
}
