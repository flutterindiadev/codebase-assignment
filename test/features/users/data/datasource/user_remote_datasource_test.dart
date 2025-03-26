import 'package:assignment/core/api_response.dart';
import 'package:assignment/core/failure.dart';
import 'package:assignment/features/users/data/datasource/user_remote_datasource.dart';
import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/api_handler_middleware_test.mocks.dart';
import '../../../../core/apiurls_test.mocks.dart';
import '../../../../utils/fixtures/fixture_reader.dart';

@GenerateNiceMocks([MockSpec<UserRemoteDatasource>()])
void main() {
  late UserRemoteDatasource remoteDataSource;
  late MockApiHandlerMiddleWare apiHandlerMiddleWare;

  late MockApiUrls apiUrls;
  final json = fixtureJson('users.json');

  setUp(() {
    apiHandlerMiddleWare = MockApiHandlerMiddleWare();
    apiUrls = MockApiUrls();

    remoteDataSource = UserRemoteDatasourceImpl(
      apiUrls,
      apiHandlerMiddleWare,
    );
  });

  group('getUsers', () {
    test('getUsers should return ApiResponse when successful', () async {
      when(apiHandlerMiddleWare.sendRequest<List<UserModel>>(any))
          .thenAnswer((_) async => ApiResponse<List<UserModel>>.success(
                data: [UserModel.fromJson(json)],
                response: Response(
                  requestOptions: RequestOptions(path: '/api/users'),
                  data: json,
                  statusCode: 200,
                ),
              ));

      final response = await remoteDataSource.getUsers(1, 1);

      expect(response, isA<ApiResponse<List<UserModel>>>());
    });

    test('should return error API Response with `Failure`', () async {
      when(apiHandlerMiddleWare.sendRequest(any)).thenAnswer(
        (_) async => const ApiResponse<List<UserModel>>.error(
          failure: Failure(message: 'Error'),
        ),
      );

      final response = await remoteDataSource.getUsers(1, 1);

      expect(response, isA<ApiResponse>());
      response.map(
        success: (_) {
          fail('Expected Error but got success');
        },
        error: (failure) {
          expect(failure.failure.message, 'Error');
        },
      );
    });
  });

  group('getUserDetail', () {
    test('getUsers should return ApiResponse when successful', () async {
      when(apiHandlerMiddleWare.sendRequest<UserModel>(any))
          .thenAnswer((_) async => ApiResponse<UserModel>.success(
                data: UserModel.fromJson(json),
                response: Response(
                  requestOptions: RequestOptions(path: '/api/users/1'),
                  data: json,
                  statusCode: 200,
                ),
              ));

      final response = await remoteDataSource.getUserDetails(1);

      expect(response, isA<ApiResponse<UserModel>>());
    });

    test('should return error API Response with `Failure`', () async {
      when(apiHandlerMiddleWare.sendRequest(any)).thenAnswer(
        (_) async => const ApiResponse<UserModel>.error(
          failure: Failure(message: 'Error'),
        ),
      );

      final response = await remoteDataSource.getUserDetails(1);

      expect(response, isA<ApiResponse>());
      response.map(
        success: (_) {
          fail('Expected Error but got success');
        },
        error: (failure) {
          expect(failure.failure.message, 'Error');
        },
      );
    });
  });
}
