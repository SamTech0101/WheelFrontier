import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/value_trade/value_trade.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/value_trade/value_trade_repository.dart';

class ValueTradeRepositoryImpl extends ValueTradeRepository {
  final Dio dio;
  ValueTradeRepositoryImpl({@required this.dio});

  @override
  Future<List<ValueTrade>> fetchValueTrades(int limit, int offset) async {
    try {
      Response response = await dio.get(
        '/dealerweb/valueyourtrades',
      );
      List valueTradeJson = response.data['rows'];
      List valueTradelist =
          valueTradeJson.map((json) => ValueTrade.fromMap(json)).toList();
      return valueTradelist;
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
  Future<void> update(ValueTrade valueTrade) async {
    try {
      Response response = await dio.patch(
        '/dealerweb/valueyourtrade/update/${valueTrade.id}',
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

class BadInputException implements Exception {
  @override
  String toString() {
    return 'Wrong inputed variables';
  }
}
