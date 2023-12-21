import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/domain/core/util/util.dart';

class CarFinder {
  int id;
  int searchPeriod;
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

  CarFinder(
      {this.id,
      this.searchPeriod,
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

  CarFinder.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    searchPeriod = json['search_period'];
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
