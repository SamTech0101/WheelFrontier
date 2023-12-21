import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us_repository.dart';

class ContactUsDealershipRepositoryImpl extends ContactUsDealershipRepository {
  final Dio dio;
  ContactUsDealershipRepositoryImpl({@required this.dio});

  @override
  Future<List<ContactUsDealership>> fetchContactUs(
      int limit, int offset) async {
    try {
      Response response = await dio.get(
        '/dealerweb/contactus',
      );
      List contactUsJson = response.data['rows'];
      List contactUslist = contactUsJson
          .map((json) => ContactUsDealership.fromMap(json))
          .toList();
      return contactUslist;
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
  Future<void> update(ContactUsDealership contactUs) async {
    try {
      Response response =
          await dio.patch('/dealerweb/contactus/update/${contactUs.id}', data: {
        'status': 2,
      });

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
