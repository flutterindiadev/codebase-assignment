import 'dart:io';

import 'package:assignment/core/api_response.dart';
import 'package:assignment/core/failure.dart';
import 'package:assignment/core/handler_generic_response.dart';
import 'package:assignment/core/requestoptions.dart';
import 'package:assignment/core/server_request_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiHandlerMiddleWare {
  final ServerRequestManager serverRequestManager;

  ApiHandlerMiddleWare(this.serverRequestManager);

  Future<ApiResponse<T>> sendRequest<T>(
    AppRequestOptions appRequestOption,
  ) async {
    try {
      var response = await serverRequestManager.sendRequest(appRequestOption);
      return ApiResponse<T>.success(
        data: handleGenericResponse<T>(response),
        response: response,
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error(
        failure: Failure(
          message: 'No Internet',
        ),
      );
    }
  }
}
