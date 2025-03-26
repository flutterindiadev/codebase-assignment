// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Response<dynamic> response) success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Response<dynamic> response)? success,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Response<dynamic> response)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiSuccessImplCopyWith<T, $Res> {
  factory _$$ApiSuccessImplCopyWith(
          _$ApiSuccessImpl<T> value, $Res Function(_$ApiSuccessImpl<T>) then) =
      __$$ApiSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, Response<dynamic> response});
}

/// @nodoc
class __$$ApiSuccessImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiSuccessImpl<T>>
    implements _$$ApiSuccessImplCopyWith<T, $Res> {
  __$$ApiSuccessImplCopyWithImpl(
      _$ApiSuccessImpl<T> _value, $Res Function(_$ApiSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = null,
  }) {
    return _then(_$ApiSuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response<dynamic>,
    ));
  }
}

/// @nodoc

class _$ApiSuccessImpl<T> implements ApiSuccess<T> {
  const _$ApiSuccessImpl({required this.data, required this.response});

  @override
  final T data;
  @override
  final Response<dynamic> response;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(data: $data, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), response);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiSuccessImplCopyWith<T, _$ApiSuccessImpl<T>> get copyWith =>
      __$$ApiSuccessImplCopyWithImpl<T, _$ApiSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Response<dynamic> response) success,
    required TResult Function(Failure failure) error,
  }) {
    return success(data, response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Response<dynamic> response)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return success?.call(data, response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Response<dynamic> response)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiSuccess<T> implements ApiResponse<T> {
  const factory ApiSuccess(
      {required final T data,
      required final Response<dynamic> response}) = _$ApiSuccessImpl<T>;

  T get data;
  Response<dynamic> get response;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiSuccessImplCopyWith<T, _$ApiSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<T, $Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl<T> value, $Res Function(_$ApiErrorImpl<T>) then) =
      __$$ApiErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiErrorImpl<T>>
    implements _$$ApiErrorImplCopyWith<T, $Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl<T> _value, $Res Function(_$ApiErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ApiErrorImpl<T>(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ApiErrorImpl<T> implements ApiError<T> {
  const _$ApiErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<T, _$ApiErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Response<dynamic> response) success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Response<dynamic> response)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Response<dynamic> response)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiError<T> implements ApiResponse<T> {
  const factory ApiError({required final Failure failure}) = _$ApiErrorImpl<T>;

  Failure get failure;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
