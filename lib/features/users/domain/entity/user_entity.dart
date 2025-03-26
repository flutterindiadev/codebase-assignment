import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  factory UserEntity({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserEntity;

  UserEntity._();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
