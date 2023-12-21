import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/domain/core/util/util.dart';
import 'package:kt_dart/kt.dart';

import 'service_pack.dart';

class ServiceAppointment {
  int id;
  String requestedDate;
  String orderNO;
  String comment;
  String status;
  DateTime date;
  String updatedAt;
  int frkUserId;
  int frkVehicleId;
  User user;
  String apiType;

  ServiceAppointment(
      {this.id,
      this.requestedDate,
      this.orderNO,
      this.comment,
      this.status,
      this.date,
      this.updatedAt,
      this.frkUserId,
      this.frkVehicleId,
      this.user,
      this.apiType});

  ServiceAppointment.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    requestedDate = json['requested_date'];
    orderNO = json['order_NO'];
    comment = json['comment'];
    status = mapintToStatus(json['status']);
    date = DateTime.parse(json['createdAt']);
    updatedAt = json['updatedAt'];
    frkUserId = json['frk_user_id'];
    frkVehicleId = json['frk_vehicle_id'];
    user = json['User'] != null ? new User.fromMap(json['User']) : null;
    apiType = json['apiType'];
  }
}
