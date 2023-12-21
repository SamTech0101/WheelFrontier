import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/application/core/utils/utils.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial_repository.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import '../../core/dio_error_codes.dart';

class TestimonialRepositoryImpl extends TestimonialRepository {
  final Dio dio;

  TestimonialRepositoryImpl({@required this.dio});
  @override
  Future<List<Testimonial>> readAll(String dealershipId) async {
    try {
      Response response =
          await dio.get('/dealerweb/testimonials/$dealershipId');
      if (response.data == []) {
        throw NoTestimonialException();
      }
      List testimonialsMap = response.data;
      List<Testimonial> testimonials = [];
      testimonialsMap.forEach(
        (map) {
          Testimonial testimonial = Testimonial.fromMap(map);
          testimonials.add(testimonial);
        },
      );
      return testimonials;
    } on DioError catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503) throw ServerInternalException();
      throw UnknownException();
    } on NoTestimonialException {
      rethrow;
    }
  }

  @override
  Future<void> create(
    String dealershipId,
    File image,
    String name,
    String comment,
    bool shoudlShowAtHomePage,
  ) async {
    try {
      var formData = FormData.fromMap(
        {
          'name': name,
          'comment': comment,
          'frk_dealership_id': dealershipId,
          'show_at_HomePage': shoudlShowAtHomePage ? 1 : 2,
          'testimonialImage': await MultipartFile.fromFile(
            image.path,
            filename: nameOf(image.path),
            contentType: MediaType('image', formatOf(image)),
          ),
        },
      );
      dio.options.headers.addAll({
        'Content-Type': 'application/json',
        'contentType': 'application/json'
      });
      Response response = await dio.post(
        '/dealerweb/testimonial/add',
        data: formData,
      );
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503) throw ServerInternalException();
      if (e.error == DioError413) throw ImageToLargeException();
      throw UnknownException();
    }
  }

  @override
  Future<void> delete(String testimonialId) async {
    await dio.delete('/dealerweb/testimonial/delete/$testimonialId');
  }

  @override
  Future<void> update(String testimonialId, File image, String name,
      String comment, bool shoudlShowAtHomePage) async {
    try {
      var formData = image != null
          ? FormData.fromMap(
              {
                'name': name,
                'comment': comment,
                'show_at_HomePage': shoudlShowAtHomePage ? 1 : 2,
                'testimonialImage': await MultipartFile.fromFile(
                  image.path,
                  filename: nameOf(image.path),
                  contentType: MediaType('image', formatOf(image)),
                ),
              },
            )
          : FormData.fromMap(
              {
                'name': name,
                'comment': comment,
                'show_at_HomePage': shoudlShowAtHomePage ? 1 : 2,
              },
            );
      Response response = await dio.patch(
        '/dealerweb/testimonial/update/$testimonialId',
        data: formData,
      );
    } catch (e) {
      if (e.error is SocketException) throw NoConnectionException();
      if (e.type == DioErrorType.connectTimeout) throw NoInternetException();
      if (e.error == DioError503 || e.error == DioError500)
        throw ServerInternalException();
      throw UnknownException();
    }
  }
}

class ImageToLargeException implements Exception {
  @override
  String toString() {
    return 'Picked image is too large';
  }
}
