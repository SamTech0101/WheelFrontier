import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment_repository.dart';

class ServiceAppointmentRepositoryImpl extends ServiceAppointmentRepository {
  final Dio dio;
  ServiceAppointmentRepositoryImpl({@required this.dio});

  @override
  Future<List<ServiceAppointment>> fetchServiceAppointments(
      int limit, int offset) async {
    try {
      Response response = await dio.get(
        '/dealerweb/service_apointments',
      );
      List serviceAppointmentJson = response.data['rows'];
      List serviceAppointmentList = serviceAppointmentJson
          .map((json) => ServiceAppointment.fromMap(json))
          .toList();
      return serviceAppointmentList;
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      var is400statusCodeFamily = is400StatusCodeFamily;
      if (is400statusCodeFamily(e.error)) throw BadInputException();
      if (is500StatusCodeFamily(e.error)) throw ServerInternalException();
      throw UnknownException();
    }
  }

  @override
  Future<void> update(ServiceAppointment serviceAppointment) async {
    try {
      Response response = await dio.patch(
        '/dealerweb/service_apointment/update/${serviceAppointment.id}',
        data: {
          'status': 2,
        },
      );
      print(response.statusCode);
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      var is400statusCodeFamily = is400StatusCodeFamily;
      if (is400statusCodeFamily(e.error)) throw BadInputException();
      if (is500StatusCodeFamily(e.error)) throw ServerInternalException();
      throw UnknownException();
    }
  }
}
