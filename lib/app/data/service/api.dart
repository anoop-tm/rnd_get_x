// baseurl
// token
// interceptor
// refresh token

import 'package:dio/dio.dart';

abstract class Api {
  static Dio _dio;

  static Dio get dio {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      _dio = new Dio(options);
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            var customHeaders = {
              'content-type': 'application/json',
              // 'Authorization': 'get it from shared pref',
            };
            options.headers.addAll(customHeaders);
            return options;
          },
        ),
      );
    }
    return _dio;
  }
}
