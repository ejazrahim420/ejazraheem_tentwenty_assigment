import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String? message;
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;

      case DioErrorType.connectTimeout:
        break;

      case DioErrorType.other:
        message = "No Internet Access";
        break;

      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;

      case DioErrorType.response:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;

      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;

      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    // ignore: avoid_print
    print("+++++ status code of api in dio exception = $statusCode");
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Authentication failed: You do not have permissions to access the service';

      case 404:
        return "Not Found";

      case 500:
        return 'Internal server error';

      case 422:
        return "Oops something went wrong!";

      default:
        return "Oops something went wrong!";
    }
  }

  @override
  String toString() => message ?? "";
}
