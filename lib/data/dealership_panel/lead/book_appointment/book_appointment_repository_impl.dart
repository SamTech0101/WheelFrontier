import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment_repository.dart';

class BookAppointmentRepositoryImpl extends BookAppointmentRepository {
  final Dio dio;
  BookAppointmentRepositoryImpl({@required this.dio});

  @override
  Future<List<BookAppointment>> fetchBookAppointment(
      int limit, int offset) async {
    try {
      Response response = await dio.get('/dealerweb/bookapointments');
      var cookiejar=getIt<CookieJar>();

      print( "salaaaaaaaaaaaaam ${cookiejar.loadForRequest(Uri.parse("https: //test111web.ca/api/user/device/check-cookie"))}");

      List bookAppointmentJson = response.data['rows'];
      List bookAppointmentList = bookAppointmentJson
          .map((json) => BookAppointment.fromMap(json))
          .toList();
      return bookAppointmentList;
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
  Future<void> update(BookAppointment bookAppointment) async {
    try {
      Response response = await dio.patch(
        '/dealerweb/bookapointment/update/${bookAppointment.id}',
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
