import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/domain/core/auth/auth_exceptions.dart';

import 'package:abs_customer_sites/domain/core/auth/auth_service.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';

class AuthServiceImpl extends AuthService {
  final Dio dio;
  AuthServiceImpl({@required this.dio});

  @override
  Future<String> signIn(String email, String password) async {
    try {
      Map<String, dynamic> signInData = {
        'username': email,
        'password': password
      };
      Response response = await dio.post(
        '/user/login',
        data: signInData,
      );
      Map<String, dynamic> map = response.data;
      if (map['token'] != null && map['token'] != '') {
        return map['token'];
      } else {
        throw InvalidEmailAndPasswordCombination();
      }
    } on DioError catch (e) {
      if (is400StatusCodeFamily(e.error))
        throw InvalidEmailAndPasswordCombination();
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      throw UnknownException();
    } on InvalidEmailAndPasswordCombination {
      rethrow;
    }
  }

  @override
  Future<User> getUserInfo() async {
    try {
      Response response = await dio.get('/user/info');
      return User.fromMap(response.data['user']);
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      throw UnknownException();
    }
  }
}
