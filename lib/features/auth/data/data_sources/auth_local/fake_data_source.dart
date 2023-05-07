import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/secure_storage_wrapper.dart';

class AuthLocalFakeDataSource implements AuthLocalDataSource {
  // TODO hardcoding here, and not in constnats, because i want tonly this to be able to retrieve data
  static const String storageIdKey = 'auth_id';
  static const String storageNicknameKey = 'auth_nickname';
  static const String storageEmailKey = 'auth_email';
  static const String storageLoggedInAtKey = "auth_logged_in_at";
  static const String storageTokenKey = "auth_token";

  const AuthLocalFakeDataSource({
    required this.secureStorageWrapper,
  });

  final SecureStorageWrapper secureStorageWrapper;

  @override
  Future<AuthLocalDTO?> getAuth() async {
    final String? id =
        await secureStorageWrapper.getKeyValue(key: storageIdKey);
    final String? nickname =
        await secureStorageWrapper.getKeyValue(key: storageNicknameKey);
    final String? email =
        await secureStorageWrapper.getKeyValue(key: storageEmailKey);
    final String? loggedInAt =
        await secureStorageWrapper.getKeyValue(key: storageLoggedInAtKey);
    final String? token =
        await secureStorageWrapper.getKeyValue(key: storageTokenKey);

    final AuthLocalDTO? auth = _getValidatedStorageAuthData(
      id: id,
      nickname: nickname,
      email: email,
      loggedInAt: loggedInAt,
      token: token,
    );

    return auth;
  }

  @override
  Future<void> saveAuth(AuthLocalDTO auth) async {
    await Future.wait([
      secureStorageWrapper.setKey(key: storageIdKey, value: auth.id),
      secureStorageWrapper.setKey(
          key: storageNicknameKey, value: auth.nickname),
      secureStorageWrapper.setKey(key: storageEmailKey, value: auth.email),
      secureStorageWrapper.setKey(
          key: storageLoggedInAtKey, value: auth.loggedInAt.toString()),
      // secureStorageWrapper.setKey(key: storageTokenKey),
    ]);
  }

  @override
  Future<void> deleteAuth() async {
    await Future.wait([
      secureStorageWrapper.deleteKey(key: storageIdKey),
      secureStorageWrapper.deleteKey(key: storageNicknameKey),
      secureStorageWrapper.deleteKey(key: storageEmailKey),
      secureStorageWrapper.deleteKey(key: storageLoggedInAtKey),
      secureStorageWrapper.deleteKey(key: storageTokenKey),
    ]);
  }

  AuthLocalDTO? _getValidatedStorageAuthData({
    required String? id,
    required String? nickname,
    required String? email,
    required String? loggedInAt,
    required String? token,
  }) {
    final bool isExistingData = id != null &&
        nickname != null &&
        email != null &&
        loggedInAt != null &&
        token != null;

    if (!isExistingData) {
      deleteAuth();

      return null;
    }

    final int? normalizedLoggedInAt = int.tryParse(loggedInAt);
    if (normalizedLoggedInAt == null) {
      deleteAuth();

      return null;
    }

    final AuthLocalDTO auth = AuthLocalDTO(
      id: id,
      nickname: nickname,
      email: email,
      loggedInAt: normalizedLoggedInAt,
      // TODO token missing
    );

    return auth;
  }
}
