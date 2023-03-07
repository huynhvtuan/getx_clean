import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean/data/network/failure.dart';
import 'package:getx_clean/data/responses/error_response.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
  firebaseAuthError,
  registerDuplicateEmailError
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultError = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;

  //firebase status error
  static const int firebaseAuthError = -100;

  //firebase status error
  static const int sessionExist = -200;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static String success = 'success'.tr; // success with data
  static String noContent = 'noContent'.tr; // success with no content
  static String badRequest =
      'badRequestError'.tr; // failure, api rejected our request
  static String forbidden =
      'forbiddenError'.tr; // failure,  api rejected our request
  static String unauthorised =
      'unauthorizedError'.tr; // failure, user is not authorised
  static String notFound = 'notFoundError'
      .tr; // failure, API url is not correct and not found in api side.
  static String internalServerError =
      'internalServerError'.tr; // failure, a crash happened in API side.

  // local responses codes
  static String defaultError = 'defaultError'.tr; // unknown error happened
  static String connectTimeout = 'timeoutError'.tr; // issue in connectivity
  static String cancel = 'defaultError'.tr; // API request was cancelled
  static String receiveTimeout = 'timeoutError'.tr; //  issue in connectivity
  static String sendTimeout = 'timeoutError'.tr; //  issue in connectivity
  static String cacheError = 'defaultError'
      .tr; //  issue in getting data from local data source (cache)
  static String noInternetConnection =
      'noInternetError'.tr; // issue in connectivity
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.badResponse:
        if (error.response?.data != null && error.response?.data is Map) {
          ErrorResponse errorResponse =
              ErrorResponse.fromJson(error.response!.data);
          if (errorResponse.error != null &&
              errorResponse.error?.code != null &&
              errorResponse.error?.message != null) {
            return Failure(
                errorResponse.error!.code ?? ResponseCode.defaultError,
                errorResponse.error!.message ?? ResponseMessage.defaultError);
          }
        }
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorised:
            return DataSource.unauthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.defaultError.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.unknown:
        if (error.error is Failure) {
          return error.error as Failure;
        }
        return DataSource.defaultError.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.defaultError.getFailure();
      case DioErrorType.connectionError:
        return DataSource.noInternetConnection.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
      default:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}
