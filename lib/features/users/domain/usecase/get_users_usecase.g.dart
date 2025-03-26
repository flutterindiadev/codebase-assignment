// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUsersUsecaseParamsImpl _$$GetUsersUsecaseParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersUsecaseParamsImpl(
      noOfUsers: (json['noOfUsers'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GetUsersUsecaseParamsImplToJson(
        _$GetUsersUsecaseParamsImpl instance) =>
    <String, dynamic>{
      'noOfUsers': instance.noOfUsers,
      'page': instance.page,
    };
