import 'dart:io';

import 'package:assignment/core/requestoptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ServerRequestManager {
  final Dio dio;

  ServerRequestManager({required this.dio});

  // coverage:ignore-start
  Future<Response> sendRequest(AppRequestOptions appRequestOption) {
    if (appRequestOption.fullUrl) {
      dio.options.baseUrl = '';
    } else {
      dio.options.baseUrl = 'https://reqres.in';
    }
    switch (appRequestOption.type) {
      case RequestTypes.get:
        return get(
          appRequestOption.url,
          queryParameters: appRequestOption.queryParameters,
          options: appRequestOption.options,
          cancelToken: appRequestOption.cancelToken,
          onReceiveProgress: appRequestOption.onReceiveProgress,
        );
      case RequestTypes.post:
        return post(
          appRequestOption.url,
          body: appRequestOption.body,
          queryParameters: appRequestOption.queryParameters,
          options: appRequestOption.options,
          cancelToken: appRequestOption.cancelToken,
          onReceiveProgress: appRequestOption.onReceiveProgress,
        );
      case RequestTypes.put:
        return put(
          appRequestOption.url,
          body: appRequestOption.body,
          queryParameters: appRequestOption.queryParameters,
          options: appRequestOption.options,
          cancelToken: appRequestOption.cancelToken,
          onReceiveProgress: appRequestOption.onReceiveProgress,
        );
      case RequestTypes.delete:
        return delete(
          appRequestOption.url,
          body: appRequestOption.body,
          queryParameters: appRequestOption.queryParameters,
          options: appRequestOption.options,
          cancelToken: appRequestOption.cancelToken,
          onReceiveProgress: appRequestOption.onReceiveProgress,
        );
      case RequestTypes.patch:
        return patch(
          appRequestOption.url,
          body: appRequestOption.body,
          queryParameters: appRequestOption.queryParameters,
          options: appRequestOption.options,
          cancelToken: appRequestOption.cancelToken,
          onReceiveProgress: appRequestOption.onReceiveProgress,
        );
    }
  }
  // coverage:ignore-end

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String uri, {
    body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.patch(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
