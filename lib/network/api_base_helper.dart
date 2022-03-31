import 'dart:io';
import 'package:dio/dio.dart';
import 'api_exception.dart';

class APIBaseHelper {
  final String _baseUrl = "https://baseurl/api_simple_customer/";
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    var responseJson;
    try {
      final response = await _dio.get(
          _baseUrl + url,
          options: Options(
              headers: {
                'Accept': 'application/json'
              })
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

  Future<Response> post(String url, {required FormData formData}) async {
    var responseJson;
    try {
      final response = await _dio.post(_baseUrl + url, data: formData);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.statusMessage);
      case 401:
      case 403:
        throw UnauthorisedException(response.statusMessage);
      case 500:
      default:
        throw FetchDataException(
            "Error occured while communication with server with status code : ${response.statusCode}");
    }
  }

}