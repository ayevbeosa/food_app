import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute * 5;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute * 5;

class DioClient {
  final String _baseUrl;

  final Dio _dio = Dio();

  final List<Interceptor> interceptors = [];

  DioClient(
    this._baseUrl,
  ) {
    _dio
      ..options.baseUrl = _baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..options.headers = {'content-type': 'application/json; charset=UTF-8'};
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
          logPrint: (text) {
            final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
            pattern
                .allMatches(text.toString())
                .forEach((match) => print(match.group(0)));
          },
        ),
      );
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      print(e);
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      print(e);
      throw FormatException('Unable to process the data');
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (e) {
      print(e);
      throw FormatException('Unable to process the data');
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
