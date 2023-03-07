import 'dart:developer';

import 'package:dio/dio.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.path += "?country=us&apiKey=ca089dc5f39c4e9ab033bd4e2ce86a82";
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      log(err.response?.statusMessage.toString() ?? '');
    }
    super.onError(err, handler);
  }
}
