import 'package:assignment/core/failure.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({
    required T data,
    required Response response,
  }) = ApiSuccess<T>;

  const factory ApiResponse.error({
    required Failure failure,
  }) = ApiError;
}
