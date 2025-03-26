import 'package:assignment/core/requestoptions.dart';
import 'package:assignment/core/server_request_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'server_request_manager_test.mocks.dart';

@GenerateMocks([Dio, ServerRequestManager, Response, AppRequestOptions])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockDio mockDio;
  late ServerRequestManager requestManager;
  setUp(() {
    mockDio = MockDio();

    requestManager = ServerRequestManager(dio: mockDio);
  });

  group('ServerRequestManager', () {
    const testUrl = 'https://api.example.com/test';
    final testResponse = Response(
      requestOptions: RequestOptions(path: testUrl),
      data: {'message': 'success'},
      statusCode: 200,
    );
    test('GET request should return Response when successful', () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => testResponse);

      final response = await requestManager.get(testUrl);

      expect(response, isA<Response>());
      expect(response.data, {'message': 'success'});
      verify(mockDio.get(testUrl, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });
  });
}
