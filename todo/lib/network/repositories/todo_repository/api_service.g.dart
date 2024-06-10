// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dummyjson.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> loginUser(body) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(body);
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/auth/login',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(result.data!);
    return value;
  }

  @override
  Future<User> getCurrentAuthUser(token) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/auth/me',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(result.data!);
    return value;
  }

  @override
  Future<Map<String, dynamic>> refreshToken(body) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(body);
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Map<String, dynamic>>(
        Options(
          method: 'POST',
          headers: headers,
          extra: extra,
        )
            .compose(
          _dio.options,
          '/auth/refresh',
          queryParameters: queryParameters,
          data: data,
        )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data!;
    return value;
  }

  @override
  Future<Map<String, dynamic>> getTodos(limit, skip) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'skip': skip
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Map<String, dynamic>>(
        Options(
          method: 'GET',
          headers: headers,
          extra: extra,
        )
            .compose(
          _dio.options,
          '/todos',
          queryParameters: queryParameters,
          data: data,
        )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data!;
    return value;
  }

  @override
  Future<Task> getTodoById(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Task>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/todos/$id',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Task.fromJson(result.data!);
    return value;
  }

  @override
  Future<Task> getRandomTodo() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Task>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/todos/random',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Task.fromJson(result.data!);
    return value;
  }

  @override
  Future<Map<String, dynamic>> getTodosByUserId(userId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Map<String, dynamic>>(
        Options(
          method: 'GET',
          headers: headers,
          extra: extra,
        )
            .compose(
          _dio.options,
          '/todos/user/$userId',
          queryParameters: queryParameters,
          data: data,
        )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data!;
    return value;
  }

  @override
  Future<Task> addTodo(body) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(body);
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Task>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/todos/add',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Task.fromJson(result.data!);
    return value;
  }

  @override
  Future<Task> updateTodo(id, body) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(body);
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Task>(Options(
      method: 'PUT',
      headers: headers,
      extra: extra,
    )
        .compose(
      _dio.options,
      '/todos/$id',
      queryParameters: queryParameters,
      data: data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Task.fromJson(result.data!);
    return value;
  }

  @override
  Future<Map<String, dynamic>> deleteTodo(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Map<String, dynamic>>(
        Options(
          method: 'DELETE',
          headers: headers,
          extra: extra,
        )
            .compose(
          _dio.options,
          '/todos/$id',
          queryParameters: queryParameters,
          data: data,
        )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
