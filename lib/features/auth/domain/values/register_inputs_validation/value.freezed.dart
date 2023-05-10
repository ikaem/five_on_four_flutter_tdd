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
mixin _$RegisterInputsValidationValue {
  FormFieldError? get emailError => throw _privateConstructorUsedError;
  FormFieldError? get passwordError => throw _privateConstructorUsedError;
  FormFieldError? get nicknameError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterInputsValidationValueCopyWith<RegisterInputsValidationValue>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterInputsValidationValueCopyWith<$Res> {
  factory $RegisterInputsValidationValueCopyWith(
          RegisterInputsValidationValue value,
          $Res Function(RegisterInputsValidationValue) then) =
      _$RegisterInputsValidationValueCopyWithImpl<$Res,
          RegisterInputsValidationValue>;
  @useResult
  $Res call(
      {FormFieldError? emailError,
      FormFieldError? passwordError,
      FormFieldError? nicknameError});
}

/// @nodoc
class _$RegisterInputsValidationValueCopyWithImpl<$Res,
        $Val extends RegisterInputsValidationValue>
    implements $RegisterInputsValidationValueCopyWith<$Res> {
  _$RegisterInputsValidationValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? nicknameError = freezed,
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
      nicknameError: freezed == nicknameError
          ? _value.nicknameError
          : nicknameError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterInputsValidationValueCopyWith<$Res>
    implements $RegisterInputsValidationValueCopyWith<$Res> {
  factory _$$_RegisterInputsValidationValueCopyWith(
          _$_RegisterInputsValidationValue value,
          $Res Function(_$_RegisterInputsValidationValue) then) =
      __$$_RegisterInputsValidationValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormFieldError? emailError,
      FormFieldError? passwordError,
      FormFieldError? nicknameError});
}

/// @nodoc
class __$$_RegisterInputsValidationValueCopyWithImpl<$Res>
    extends _$RegisterInputsValidationValueCopyWithImpl<$Res,
        _$_RegisterInputsValidationValue>
    implements _$$_RegisterInputsValidationValueCopyWith<$Res> {
  __$$_RegisterInputsValidationValueCopyWithImpl(
      _$_RegisterInputsValidationValue _value,
      $Res Function(_$_RegisterInputsValidationValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? nicknameError = freezed,
  }) {
    return _then(_$_RegisterInputsValidationValue(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      nicknameError: freezed == nicknameError
          ? _value.nicknameError
          : nicknameError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ));
  }
}

/// @nodoc

class _$_RegisterInputsValidationValue extends _RegisterInputsValidationValue {
  const _$_RegisterInputsValidationValue(
      {required this.emailError,
      required this.passwordError,
      required this.nicknameError})
      : super._();

  @override
  final FormFieldError? emailError;
  @override
  final FormFieldError? passwordError;
  @override
  final FormFieldError? nicknameError;

  @override
  String toString() {
    return 'RegisterInputsValidationValue(emailError: $emailError, passwordError: $passwordError, nicknameError: $nicknameError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterInputsValidationValue &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.nicknameError, nicknameError) ||
                other.nicknameError == nicknameError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailError, passwordError, nicknameError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterInputsValidationValueCopyWith<_$_RegisterInputsValidationValue>
      get copyWith => __$$_RegisterInputsValidationValueCopyWithImpl<
          _$_RegisterInputsValidationValue>(this, _$identity);
}

abstract class _RegisterInputsValidationValue
    extends RegisterInputsValidationValue {
  const factory _RegisterInputsValidationValue(
          {required final FormFieldError? emailError,
          required final FormFieldError? passwordError,
          required final FormFieldError? nicknameError}) =
      _$_RegisterInputsValidationValue;
  const _RegisterInputsValidationValue._() : super._();

  @override
  FormFieldError? get emailError;
  @override
  FormFieldError? get passwordError;
  @override
  FormFieldError? get nicknameError;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterInputsValidationValueCopyWith<_$_RegisterInputsValidationValue>
      get copyWith => throw _privateConstructorUsedError;
}
