// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_details_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserDetailsUsecaseParams _$GetUserDetailsUsecaseParamsFromJson(
    Map<String, dynamic> json) {
  return _GetUserDetailsUsecaseParams.fromJson(json);
}

/// @nodoc
mixin _$GetUserDetailsUsecaseParams {
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this GetUserDetailsUsecaseParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserDetailsUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserDetailsUsecaseParamsCopyWith<GetUserDetailsUsecaseParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserDetailsUsecaseParamsCopyWith<$Res> {
  factory $GetUserDetailsUsecaseParamsCopyWith(
          GetUserDetailsUsecaseParams value,
          $Res Function(GetUserDetailsUsecaseParams) then) =
      _$GetUserDetailsUsecaseParamsCopyWithImpl<$Res,
          GetUserDetailsUsecaseParams>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$GetUserDetailsUsecaseParamsCopyWithImpl<$Res,
        $Val extends GetUserDetailsUsecaseParams>
    implements $GetUserDetailsUsecaseParamsCopyWith<$Res> {
  _$GetUserDetailsUsecaseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserDetailsUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserDetailsUsecaseParamsImplCopyWith<$Res>
    implements $GetUserDetailsUsecaseParamsCopyWith<$Res> {
  factory _$$GetUserDetailsUsecaseParamsImplCopyWith(
          _$GetUserDetailsUsecaseParamsImpl value,
          $Res Function(_$GetUserDetailsUsecaseParamsImpl) then) =
      __$$GetUserDetailsUsecaseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$GetUserDetailsUsecaseParamsImplCopyWithImpl<$Res>
    extends _$GetUserDetailsUsecaseParamsCopyWithImpl<$Res,
        _$GetUserDetailsUsecaseParamsImpl>
    implements _$$GetUserDetailsUsecaseParamsImplCopyWith<$Res> {
  __$$GetUserDetailsUsecaseParamsImplCopyWithImpl(
      _$GetUserDetailsUsecaseParamsImpl _value,
      $Res Function(_$GetUserDetailsUsecaseParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserDetailsUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$GetUserDetailsUsecaseParamsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserDetailsUsecaseParamsImpl extends _GetUserDetailsUsecaseParams {
  _$GetUserDetailsUsecaseParamsImpl({required this.id}) : super._();

  factory _$GetUserDetailsUsecaseParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetUserDetailsUsecaseParamsImplFromJson(json);

  @override
  final int? id;

  @override
  String toString() {
    return 'GetUserDetailsUsecaseParams(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDetailsUsecaseParamsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of GetUserDetailsUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDetailsUsecaseParamsImplCopyWith<_$GetUserDetailsUsecaseParamsImpl>
      get copyWith => __$$GetUserDetailsUsecaseParamsImplCopyWithImpl<
          _$GetUserDetailsUsecaseParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserDetailsUsecaseParamsImplToJson(
      this,
    );
  }
}

abstract class _GetUserDetailsUsecaseParams
    extends GetUserDetailsUsecaseParams {
  factory _GetUserDetailsUsecaseParams({required final int? id}) =
      _$GetUserDetailsUsecaseParamsImpl;
  _GetUserDetailsUsecaseParams._() : super._();

  factory _GetUserDetailsUsecaseParams.fromJson(Map<String, dynamic> json) =
      _$GetUserDetailsUsecaseParamsImpl.fromJson;

  @override
  int? get id;

  /// Create a copy of GetUserDetailsUsecaseParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserDetailsUsecaseParamsImplCopyWith<_$GetUserDetailsUsecaseParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
