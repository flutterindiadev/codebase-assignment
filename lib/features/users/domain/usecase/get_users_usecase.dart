import 'dart:async';

import 'package:assignment/core/failure.dart';
import 'package:assignment/core/usecase.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:assignment/features/users/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_users_usecase.freezed.dart';
part 'get_users_usecase.g.dart';

@lazySingleton
class GetUsersUsecase extends UseCase<List<UserEntity>, GetUsersUsecaseParams> {
  final UserRepository _userRepository;
  GetUsersUsecase(this._userRepository);

  @override
  FutureOr<Either<Failure, List<UserEntity>>> call(
      GetUsersUsecaseParams params) {
    return _userRepository.getUsers(params.noOfUsers!, params.page!);
  }
}

@freezed
class GetUsersUsecaseParams with _$GetUsersUsecaseParams {
  factory GetUsersUsecaseParams({
    required int? noOfUsers,
    required int? page,
  }) = _GetUsersUsecaseParams;
  factory GetUsersUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$GetUsersUsecaseParamsFromJson(json);

  GetUsersUsecaseParams._();
}
