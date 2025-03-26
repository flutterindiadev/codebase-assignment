// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUsersUsecaseParams _$GetUsersUsecaseParamsFromJson(
    Map<String, dynamic> json) {
  return _GetUsersUsecaseParams.fromJson(json);
}

/// @nodoc
mixin _$GetUsersUsecaseParams {
  int? get noOfUsers => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  /// Serializes this GetUsersUsecaseParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUsersUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUsersUsecaseParamsCopyWith<GetUsersUsecaseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersUsecaseParamsCopyWith<$Res> {
  factory $GetUsersUsecaseParamsCopyWith(GetUsersUsecaseParams value,
          $Res Function(GetUsersUsecaseParams) then) =
      _$GetUsersUsecaseParamsCopyWithImpl<$Res, GetUsersUsecaseParams>;
  @useResult
  $Res call({int? noOfUsers, int? page});
}

/// @nodoc
class _$GetUsersUsecaseParamsCopyWithImpl<$Res,
        $Val extends GetUsersUsecaseParams>
    implements $GetUsersUsecaseParamsCopyWith<$Res> {
  _$GetUsersUsecaseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUsersUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noOfUsers = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      noOfUsers: freezed == noOfUsers
          ? _value.noOfUsers
          : noOfUsers // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUsersUsecaseParamsImplCopyWith<$Res>
    implements $GetUsersUsecaseParamsCopyWith<$Res> {
  factory _$$GetUsersUsecaseParamsImplCopyWith(
          _$GetUsersUsecaseParamsImpl value,
          $Res Function(_$GetUsersUsecaseParamsImpl) then) =
      __$$GetUsersUsecaseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? noOfUsers, int? page});
}

/// @nodoc
class __$$GetUsersUsecaseParamsImplCopyWithImpl<$Res>
    extends _$GetUsersUsecaseParamsCopyWithImpl<$Res,
        _$GetUsersUsecaseParamsImpl>
    implements _$$GetUsersUsecaseParamsImplCopyWith<$Res> {
  __$$GetUsersUsecaseParamsImplCopyWithImpl(_$GetUsersUsecaseParamsImpl _value,
      $Res Function(_$GetUsersUsecaseParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUsersUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noOfUsers = freezed,
    Object? page = freezed,
  }) {
    return _then(_$GetUsersUsecaseParamsImpl(
      noOfUsers: freezed == noOfUsers
          ? _value.noOfUsers
          : noOfUsers // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUsersUsecaseParamsImpl extends _GetUsersUsecaseParams {
  _$GetUsersUsecaseParamsImpl({required this.noOfUsers, required this.page})
      : super._();

  factory _$GetUsersUsecaseParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersUsecaseParamsImplFromJson(json);

  @override
  final int? noOfUsers;
  @override
  final int? page;

  @override
  String toString() {
    return 'GetUsersUsecaseParams(noOfUsers: $noOfUsers, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersUsecaseParamsImpl &&
            (identical(other.noOfUsers, noOfUsers) ||
                other.noOfUsers == noOfUsers) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, noOfUsers, page);

  /// Create a copy of GetUsersUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUsersUsecaseParamsImplCopyWith<_$GetUsersUsecaseParamsImpl>
      get copyWith => __$$GetUsersUsecaseParamsImplCopyWithImpl<
          _$GetUsersUsecaseParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUsersUsecaseParamsImplToJson(
      this,
    );
  }
}

abstract class _GetUsersUsecaseParams extends GetUsersUsecaseParams {
  factory _GetUsersUsecaseParams(
      {required final int? noOfUsers,
      required final int? page}) = _$GetUsersUsecaseParamsImpl;
  _GetUsersUsecaseParams._() : super._();

  factory _GetUsersUsecaseParams.fromJson(Map<String, dynamic> json) =
      _$GetUsersUsecaseParamsImpl.fromJson;

  @override
  int? get noOfUsers;
  @override
  int? get page;

  /// Create a copy of GetUsersUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUsersUsecaseParamsImplCopyWith<_$GetUsersUsecaseParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
