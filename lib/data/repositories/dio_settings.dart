// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

class DioSettings {
  DioSettings() {
    setup();
  }
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: 1500,
      receiveTimeout: 1500,
    ),
  );

  void setup() {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterseptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        print('ON REQUEST ОТПРАВЯЛ ЗАПРОС');
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        print('ON ERROR ОШИБКА ОТ ДИО');
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptors.addAll([
      logInterceptor,
      headerInterseptors,
    ]);
  }
}
