import 'package:assignment/core/failure.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers(int noOfUser, int page);
  Future<Either<Failure, UserEntity>> getUserDetails(int id);
}
