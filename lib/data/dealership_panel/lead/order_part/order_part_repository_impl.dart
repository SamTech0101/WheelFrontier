import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/order_part/order_part.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/order_part/order_part_repository.dart';

class OrderPartRepositoryImpl extends OrderPartRepository {
  final Dio dio;
  OrderPartRepositoryImpl({@required this.dio});

  @override
  Future<List<OrderPart>> fetchOrderParts(int limit, int offset) async {
    try {
      Response response = await dio.get(
        '/dealerweb/orderparts',
      );
      List orderPartJson = response.data['rows'];
      List orderPartlist =
          orderPartJson.map((json) => OrderPart.fromMap(json)).toList();
      return orderPartlist;
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
  Future<void> update(OrderPart orderPart) async {
    try {
      Response response = await dio.patch(
        '/dealerweb/orderpart/update/${orderPart.id}',
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
