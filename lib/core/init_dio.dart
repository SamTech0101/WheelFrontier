import 'package:dio/dio.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
const CDNBaseUrl = 'https://absimage.net';
const BaseUrl = 'https://test/api';

// configuring dio with deafult options

initDio() {
  Dio dio = getIt<Dio>();
  var cookieJar=getIt<CookieJar>();
  dio.interceptors.add(CookieManager(cookieJar));

  dio.options.baseUrl = BaseUrl;
  dio.options.connectTimeout = 20000;
  dio.options.receiveTimeout = 20000;
  PrettyDioLogger prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );
  dio.interceptors.add(prettyDioLogger);

}
