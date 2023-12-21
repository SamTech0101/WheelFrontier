import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/domain/core/util/util.dart';

class ValueTrade {
  int id;
  int vehicleKilometers;
  int vehicleMiles;
  String additionalInfo;
  String status;
  DateTime date;
  String updatedAt;
  int frkUserId;
  int frkVehicleId;
  User user;
  String apiType;

  ValueTrade(
      {this.id,
      this.vehicleKilometers,
      this.vehicleMiles,
      this.additionalInfo,
      this.status,
      this.date,
      this.updatedAt,
      this.frkUserId,
      this.frkVehicleId,
      this.user,
      this.apiType});

  ValueTrade.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    vehicleKilometers = json['vehicle_kilometers'];
    vehicleMiles = json['vehicle_miles'];
    additionalInfo = json['additional_info'];
    status = mapintToStatus(json['status']);
    date = DateTime.parse(json['createdAt']);
    updatedAt = json['updatedAt'];
    frkUserId = json['frk_user_id'];
    frkVehicleId = json['frk_vehicle_id'];
    user = json['User'] != null ? new User.fromMap(json['User']) : null;
    apiType = json['apiType'];
  }
}
