import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_clean/data/network/interceptor/connectivity_interceptor.dart';
import 'package:getx_clean/data/network/interceptor/request_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RequestHeaders {
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String defaultLanguage = "language";
  static const String securedKey = 'secured';
  static const String culture = 'vi_VN';
}

class DioFactory extends GetxService {
  Dio get dio {
    final dio = Dio();
    const timeOut = Duration(minutes: 1); // 1 min
    Map<String, String> headers = {
      RequestHeaders.contentType: RequestHeaders.applicationJson,
      RequestHeaders.accept: RequestHeaders.applicationJson,
    };
    dio.options = BaseOptions(
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers,
        baseUrl: 'https://newsapi.org');
    dio.interceptors.addAll([
      ConnectivityInterceptor(),
      RequestInterceptor(),
    ]);
    if (kReleaseMode) {
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
