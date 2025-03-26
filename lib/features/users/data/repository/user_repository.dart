import 'package:assignment/core/failure.dart';
import 'package:assignment/features/users/data/datasource/user_remote_datasource.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:assignment/features/users/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource userRemoteDatasource;
  UserRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> getUserDetails(int id) async {
    final response = await userRemoteDatasource.getUserDetails(id);
    return response.when(
      success: (data, response) {
        return Right(UserEntity(
          id: data.id,
          email: data.email,
          firstName: data.first_name,
          lastName: data.last_name,
          avatar: data.avatar,
        ));
      },
      error: (failure) {
        return Left(failure);
      },
    );
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers(
      int noOfUser, int page) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await userRemoteDatasource.getUsers(noOfUser, page);
    return response.when(
      success: (data, response) {
        sharedPreferences.setInt('total_pages', response.data['total_pages']);
        return Right(data
            .map((e) => UserEntity(
                  id: e.id,
                  email: e.email,
                  firstName: e.first_name,
                  lastName: e.last_name,
                  avatar: e.avatar,
                ))
            .toList());
      },
      error: (failure) {
        return Left(failure);
      },
    );
  }
}
