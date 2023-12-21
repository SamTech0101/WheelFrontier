import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/test_drive/test_drive.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/test_drive/test_drive_repository.dart';

class TestDriveRepositoryImpl extends TestDriveRepository {
  final Dio dio;
  TestDriveRepositoryImpl({@required this.dio});

  @override
  Future<List<TestDrive>> fetchTestDrives(int limit, int offset) {
    // TODO: implement fetchTestDrives
    throw UnimplementedError();
  }

  @override
  Future<String> update(TestDrive testDrive) async {
    try {
      Map<String, dynamic> testDriveJson = testDrive.toMap();
      Response response = await dio.post(
        '/dealerweb/testdrive/add',
        data: testDriveJson,
      );
      Map<String, dynamic> map = response.data;
      if (map['token'] != null) {
        return map['token'];
      } else {
        throw UnknownException();
      }
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (is400StatusCodeFamily(e.error)) throw BadInputException();
      if (is500StatusCodeFamily(e.error)) throw ServerInternalException();
      throw UnknownException();
    }
  }
}
