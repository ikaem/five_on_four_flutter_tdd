// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginInputsValidationValue {
  FormFieldError? get emailError => throw _privateConstructorUsedError;
  FormFieldError? get passwordError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginInputsValidationValueCopyWith<LoginInputsValidationValue>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInputsValidationValueCopyWith<$Res> {
  factory $LoginInputsValidationValueCopyWith(LoginInputsValidationValue value,
          $Res Function(LoginInputsValidationValue) then) =
      _$LoginInputsValidationValueCopyWithImpl<$Res,
          LoginInputsValidationValue>;
  @useResult
  $Res call({FormFieldError? emailError, FormFieldError? passwordError});
}

/// @nodoc
class _$LoginInputsValidationValueCopyWithImpl<$Res,
        $Val extends LoginInputsValidationValue>
    implements $LoginInputsValidationValueCopyWith<$Res> {
  _$LoginInputsValidationValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_value.copyWith(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginInputsValidationValueCopyWith<$Res>
    implements $LoginInputsValidationValueCopyWith<$Res> {
  factory _$$_LoginInputsValidationValueCopyWith(
          _$_LoginInputsValidationValue value,
          $Res Function(_$_LoginInputsValidationValue) then) =
      __$$_LoginInputsValidationValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormFieldError? emailError, FormFieldError? passwordError});
}

/// @nodoc
class __$$_LoginInputsValidationValueCopyWithImpl<$Res>
    extends _$LoginInputsValidationValueCopyWithImpl<$Res,
        _$_LoginInputsValidationValue>
    implements _$$_LoginInputsValidationValueCopyWith<$Res> {
  __$$_LoginInputsValidationValueCopyWithImpl(
      _$_LoginInputsValidationValue _value,
      $Res Function(_$_LoginInputsValidationValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_$_LoginInputsValidationValue(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ));
  }
}

/// @nodoc

class _$_LoginInputsValidationValue extends _LoginInputsValidationValue {
  const _$_LoginInputsValidationValue(
      {required this.emailError, required this.passwordError})
      : super._();

  @override
  final FormFieldError? emailError;
  @override
  final FormFieldError? passwordError;

  @override
  String toString() {
    return 'LoginInputsValidationValue(emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInputsValidationValue &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailError, passwordError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInputsValidationValueCopyWith<_$_LoginInputsValidationValue>
      get copyWith => __$$_LoginInputsValidationValueCopyWithImpl<
          _$_LoginInputsValidationValue>(this, _$identity);
}

abstract class _LoginInputsValidationValue extends LoginInputsValidationValue {
  const factory _LoginInputsValidationValue(
          {required final FormFieldError? emailError,
          required final FormFieldError? passwordError}) =
      _$_LoginInputsValidationValue;
  const _LoginInputsValidationValue._() : super._();

  @override
  FormFieldError? get emailError;
  @override
  FormFieldError? get passwordError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInputsValidationValueCopyWith<_$_LoginInputsValidationValue>
      get copyWith => throw _privateConstructorUsedError;
}
