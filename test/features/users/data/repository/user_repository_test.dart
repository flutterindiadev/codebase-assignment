import 'package:assignment/core/api_response.dart';
import 'package:assignment/core/failure.dart';
import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:assignment/features/users/data/repository/user_repository.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:assignment/features/users/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../utils/fixtures/fixture_reader.dart';
import '../datasource/user_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRepository>()])
void main() {
  late MockUserRemoteDatasource remoteDataSource;

  late UserRepository repository;
  final json = fixtureJson('users.json');

  setUpAll(() {
    remoteDataSource = MockUserRemoteDatasource();

    repository = UserRepositoryImpl(remoteDataSource);
  });

  group('getUsers', () {
    test(
        'should return List<UserModel> on successful response with statusCode 200',
        () async {
      when(remoteDataSource.getUsers(1, 1)).thenAnswer(
        (_) async => ApiResponse<List<UserModel>>.success(
          data: [],
          response: Response(requestOptions: RequestOptions(), statusCode: 200),
        ),
      );

      final response = await repository.getUsers(1, 1);

      expect(response, isA<Right>());
      response.fold((l) {
        fail('Expected Success but got Failure');
      }, (r) {
        expect(r, []);
      });
    });

    test('should return Failure on error response', () async {
      when(remoteDataSource.getUsers(1, 1)).thenAnswer(
        (_) async => ApiResponse.error(
          failure: Failure.fromUnknownException(),
        ),
      );

      final response = await repository.getUsers(1, 1);

      expect(response, isA<Left>());
    });
  });

  group('getUserdetails', () {
    test('should return UserModel on successful response with statusCode 200',
        () async {
      when(remoteDataSource.getUserDetails(1)).thenAnswer(
        (_) async => ApiResponse<UserModel>.success(
          data: UserModel.fromJson(json),
          response: Response(requestOptions: RequestOptions(), statusCode: 200),
        ),
      );

      final response = await repository.getUserDetails(1);

      expect(response, isA<Right>());
      response.fold((l) {
        fail('Expected Success but got Failure');
      }, (r) {
        expect(r, isA<UserEntity>());
      });
    });

    test('should return Failure on error response', () async {
      when(remoteDataSource.getUsers(1, 1)).thenAnswer(
        (_) async => ApiResponse.error(
          failure: Failure.fromUnknownException(),
        ),
      );

      final response = await repository.getUsers(1, 1);

      expect(response, isA<Left>());
    });
  });
}
