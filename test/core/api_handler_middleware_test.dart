import 'dart:io';

import 'package:assignment/core/api_handler_middleware.dart';
import 'package:assignment/core/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'server_request_manager_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiHandlerMiddleWare>()])
void main() {
  late ApiHandlerMiddleWare apiHandler;
  late MockServerRequestManager mockServerRequestManager;
  setUp(() {
    mockServerRequestManager = MockServerRequestManager();
    apiHandler = ApiHandlerMiddleWare(mockServerRequestManager);
  });

  group('ApiHandlerMiddleWare - sendRequest', () {
    test('✅ Should return success when API call is successful', () async {
      // Arrange
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/success'),
        data: {'message': 'Success'},
        statusCode: 200,
      );

      when(mockServerRequestManager.sendRequest(any))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await apiHandler.sendRequest<Map<String, dynamic>>(
        MockAppRequestOptions(), // Pass required arguments
      );

      // Assert
      expect(result, isA<ApiSuccess<Map<String, dynamic>>>());
      expect((result as ApiSuccess).data['message'], 'Success');
    });
  });

  test('Should return no internet error on SocketException', () async {
    // Arrange
    when(mockServerRequestManager.sendRequest(any))
        .thenThrow(const SocketException('No Internet'));

    // Act
    final result = await apiHandler.sendRequest<Map<String, dynamic>>(
      MockAppRequestOptions(),
    );

    // Assert
    expect(result, isA<ApiError>());
    expect(
      (result as ApiError).failure.message,
      'No Internet',
    );
  });
}
