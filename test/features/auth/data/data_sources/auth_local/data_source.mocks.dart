// Mocks generated by Mockito 5.4.0 from annotations
// in five_on_four_flutter_tdd/test/features/auth/data/data_sources/auth_local/data_source.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart'
    as _i2;
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i2.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.AuthLocalDTO?> getAuth() => (super.noSuchMethod(
        Invocation.method(
          #getAuth,
          [],
        ),
        returnValue: _i3.Future<_i4.AuthLocalDTO?>.value(),
      ) as _i3.Future<_i4.AuthLocalDTO?>);
  @override
  _i3.Future<void> deleteAuth() => (super.noSuchMethod(
        Invocation.method(
          #deleteAuth,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
