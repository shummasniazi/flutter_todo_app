import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../network/repositories/todo_repository/api_imp.dart';
import '../../network/repositories/todo_repository/api_service.dart';
import '../local_storage.dart';


final getIt = GetIt.instance;

void setup() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    logPrint: (log) {
      if (kDebugMode) {
        print(log);
      }
    },
  ));

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<Repository>(() => Repository(getIt<ApiService>()));
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage());
}
