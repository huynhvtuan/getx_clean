import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean/data/network/network_info.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  final NetworkInfo _networkInfo = Get.find();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!Platform.isWindows && !(await _networkInfo.isConnected)) {
      return handler.reject(DioError(
          requestOptions: options,
          error: {'statusMessage': "No internet"},
          type: DioErrorType.connectionError));
    }
    return handler.next(options);
  }
}
