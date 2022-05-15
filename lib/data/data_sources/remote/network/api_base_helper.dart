import 'package:dio/dio.dart';

class APIBaseHelper {
  final String baseUrl = "https://baseurl/api_simple_customer/";

  BaseOptions createOption() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: 5000,
        connectTimeout: 5000,
        headers: {
          'Accept': 'application/json'
        }
    );

    return options;
  }

  String handleError(Object error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }

    return errorDescription;
  }

}