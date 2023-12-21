import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/data/core/dio_error_codes.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_request.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_response.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';

class WebDescriptionRepositoryImpl extends WebDescriptionRepository {
  final Dio dio;

  WebDescriptionRepositoryImpl({@required this.dio});

  @override
  Future<WebDescriptionResponse> read(String dealershipId) async {
    try {
      Response response =
          await dio.get('/dealerweb/descriptions/$dealershipId');
      List datas = response.data;
      if (datas.isNotEmpty) {
        WebDescriptionResponse webDescriptionResponse =
            WebDescriptionResponse.fromMap(response.data[0]);
        return webDescriptionResponse;
      } else {
        throw NoWebDescrpitionFound();
      }
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError404) throw NoWebDescrpitionFound();
      if (e.error == DioError503) throw ServerInternalException();
      throw UnknownException();
    } on NoWebDescrpitionFound {
      rethrow;
    }
  }

  @override
  Future<void> create(WebDescriptionRequest webDescription) async {
    try {
      Map<String, dynamic> map = webDescription.toMap();
      if (webDescription.image.path != '') {
        map.addAll({
          'descriptionImage': await MultipartFile.fromFile(
            webDescription.image.path,
          ),
        });
      }
      if (webDescription.video.path != '') {
        map.addAll({
          'descriptionVideo': await MultipartFile.fromFile(
            webDescription.video.path,
          ),
        });
      }
      var formData = FormData.fromMap(map);
      await dio.post(
        '/dealerweb/description/add',
        data: formData,
      );
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError404) throw NoWebDescrpitionFound();
      if (e.error == DioError503) throw ServerInternalException();
      throw UnknownException();
    }
  }

  @override
  Future<void> update(
      String webDescriptionId, WebDescriptionRequest webDescription) async {
    try {
      Map<String, dynamic> map = webDescription.toMap();
      if (webDescription.image.path != '') {
        map.addAll({
          'descriptionImage': await MultipartFile.fromFile(
            webDescription.image.path,
          ),
        });
      }
      if (webDescription.video.path != '') {
        map.addAll({
          'descriptionVideo': await MultipartFile.fromFile(
            webDescription.video.path,
          ),
        });
      }
      var formData = FormData.fromMap(map);
      await dio.patch(
        '/dealerweb/description/update/$webDescriptionId',
        data: formData,
      );
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError404) throw NoWebDescrpitionFound();
      if (e.error == DioError503) throw ServerInternalException();
      throw UnknownException();
    }
  }
}
