import 'dart:async';

import 'package:assignment/core/failure.dart';
import 'package:assignment/core/usecase.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../repository/user_repository.dart';

part 'get_user_details_usecase.freezed.dart';
part 'get_user_details_usecase.g.dart';

@lazySingleton
class GetUserDetailsUsecase
    extends UseCase<UserEntity, GetUserDetailsUsecaseParams> {
  final UserRepository _userRepository;
  GetUserDetailsUsecase(this._userRepository);

  @override
  FutureOr<Either<Failure, UserEntity>> call(
      GetUserDetailsUsecaseParams params) {
    return _userRepository.getUserDetails(params.id!);
  }
}

@freezed
class GetUserDetailsUsecaseParams with _$GetUserDetailsUsecaseParams {
  factory GetUserDetailsUsecaseParams({
    required int? id,
  }) = _GetUserDetailsUsecaseParams;
  factory GetUserDetailsUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsUsecaseParamsFromJson(json);

  GetUserDetailsUsecaseParams._();
}
