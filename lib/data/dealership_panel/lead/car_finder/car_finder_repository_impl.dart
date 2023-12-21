import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder_repository.dart';

class CarFinderRepositoryImpl extends CarFinderRepository {
  final Dio dio;
  CarFinderRepositoryImpl({@required this.dio});

  @override
  Future<List<CarFinder>> fetchCarFinders(int limit, int offset) async {
    try {
      Response response = await dio.get(
        '/dealerweb/carFinders',
      );
      List carFinderJson = response.data['rows'];
      List carFinderlist =
          carFinderJson.map((json) => CarFinder.fromMap(json)).toList();
      return carFinderlist;
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
  Future<void> update(CarFinder carFinder) async {
    try {
      Response response = await dio.patch(
        '/dealerweb/carfinder/update/${carFinder.id}',
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
