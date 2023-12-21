import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';

import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request_repository.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';

class SignUpRequestRepositoryImpl extends SingUpRequestRepository {
  final Dio dio;
  SignUpRequestRepositoryImpl({@required this.dio});

  @override
  Future<List<SignUpRequest>> readAll() async {
    try {
      Response response = await dio.get('/dealerships');
      List listData = response.data['rows'];
      List<SignUpRequest> requests = [];
      listData.forEach((request) {
        SignUpRequest singUpRequest = SignUpRequest.fromMap(request);
        requests.add(singUpRequest);
      });
      return requests;
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503) throw ServerInternalException();
    }
    return [];
  }

  @override
  Future<SignUpRequest> read(String requestId) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(SignUpRequest signUpRequest, String status) async {
    try {
      await dio.patch(
        '/dealership/status/${signUpRequest.id}',
        data: {
          'status': status,
          'sms': signUpRequest.acceptMessageSMS,
          'email': 'rezesheha@gmail.com',
          'result': 'accept',
        },
      );
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503) throw ServerInternalException();
    }
  }
}
