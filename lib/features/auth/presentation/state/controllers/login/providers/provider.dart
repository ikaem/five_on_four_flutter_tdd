import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/login/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class LoginAppController extends _$LoginAppController
    with ValidationMixin
    implements LoginController {


@override
AsyncValue<void> build() {

}


  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement emailStream
  Stream<String> get emailStream => throw UnimplementedError();

  @override
  // TODO: implement inputsValidationStream
  Stream<bool> get inputsValidationStream => throw UnimplementedError();

  @override
  void onEmailChange(String value) {
    // TODO: implement onEmailChange
  }

  @override
  void onPasswordChange(String value) {
    // TODO: implement onPasswordChange
  }

  @override
  Future<void> onSubmit() {
    // TODO: implement onSubmit
    throw UnimplementedError();
  }

  @override
  // TODO: implement passwordStream
  Stream<String> get passwordStream => throw UnimplementedError();



  void _initializeController
}
