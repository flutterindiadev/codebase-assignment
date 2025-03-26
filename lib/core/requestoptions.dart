import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

enum RequestTypes { post, get, put, patch, delete }

class AppRequestOptions extends Equatable {
  final RequestTypes type;
  final String url;
  final dynamic body;
  final Map<String, dynamic>? queryParameters;
  final Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  final bool fullUrl;

  const AppRequestOptions(
    this.type,
    this.url, {
    this.body,
    this.queryParameters,
    this.options,
    this.cancelToken,
    this.onReceiveProgress,
    this.fullUrl = false,
  });

  @override
  List<Object?> get props => [
        type,
        url,
        body,
        queryParameters,
        options,
        cancelToken,
        onReceiveProgress,
        fullUrl,
      ];
}
