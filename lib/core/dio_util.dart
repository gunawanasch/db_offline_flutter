import 'package:dio/dio.dart';

class DioUtil {
  late Dio dio;

  DioUtil(this.dio);

  Dio getInstance() {
    dio = createDioInstance();
    return dio;
  }

  Dio createDioInstance() {
    var dio = Dio();

    //-------------------- for interceptor ----------------------------------
    // dio.interceptors.clear();
    // dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    //   return handler.next(options);
    // }, onResponse: (response, handler) {
    //   if (response != null) {
    //     return handler.next(response);
    //   } else {
    //     return;
    //   }
    // }, onError: (DioError e, handler) async {
    //   if (e.response != null) {
    //     if (e.response?.statusCode == 401) {
    //
    //     } else {
    //       handler.next(e);
    //     }
    //   }
    //
    // }));

    return dio;
  }

}