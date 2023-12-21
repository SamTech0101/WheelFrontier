import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership_repository.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';

class DealershipRepositoryImpl extends DealershipRepository {
  final Dio dio;
  DealershipRepositoryImpl({@required this.dio});
  @override
  Future<List<Dealership>> getAllDealershipNames() async {
    try {
      Map<String, dynamic> queryParams = {
        'attributes': 'id,bussiness_name',
      };
      Response response = await dio.get(
        '/dealerships',
        queryParameters: queryParams,
      );
      List dealershipsMaps = response.data['rows'];
      List<Dealership> dealerships = [];
      dealershipsMaps.forEach((map) {
        Dealership dealership = Dealership.fromMap(map);
        dealerships.add(dealership);
      });
      return dealerships;
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503 || e.error == DioError500)
        throw ServerInternalException();
    }
    return [];
  }
}
