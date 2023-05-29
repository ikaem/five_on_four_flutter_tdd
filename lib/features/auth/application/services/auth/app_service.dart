import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/utils/constants/players_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class AuthAppService implements AuthService {
  AuthAppService({
    required AuthRepository authRepository,
    required AuthStatusRepository authStatusRepository,
    required PlayersRepository playersRepository,
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
  })  : _playersRepository = playersRepository,
        _authRepository = authRepository,
        _authStatusRepository = authStatusRepository,
        _firebaseMessagingWrapper = firebaseMessagingWrapper;

  final AuthRepository _authRepository;
  final AuthStatusRepository _authStatusRepository;
  final PlayersRepository _playersRepository;
  final FirebaseMessagingWrapper _firebaseMessagingWrapper;

  @override
  Stream<AuthModel?> get authStatusStream =>
      _authStatusRepository.observeAuthStatus();

  @override
  Future<void> checkAuth() async {
    final AuthModel? auth = await _authRepository.checkAuth();

    final String? deviceToken =
        await _firebaseMessagingWrapper.getDeviceToken();

    final bool shouldUpdateDeviceToken = auth != null && deviceToken != null;
    if (shouldUpdateDeviceToken) {
      final String playerId = auth.player.id;

      await _playersRepository.updatePlayerField(
        playerId: playerId,
        fieldName: PlayersFirebaseConstants.fieldDeviceToken,
        fieldValue: deviceToken,
      );
    }

    _authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> login(LoginCredentialsArgs args) async {
    final AuthModel auth = await _authRepository.login(args);

    final String? deviceToken =
        await _firebaseMessagingWrapper.getDeviceToken();

    final bool shouldUpdateDeviceToken = deviceToken != null;
    if (shouldUpdateDeviceToken) {
      final String playerId = auth.player.id;

      await _playersRepository.updatePlayerField(
        playerId: playerId,
        fieldName: PlayersFirebaseConstants.fieldDeviceToken,
        fieldValue: deviceToken,
      );
    }

    _authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> logout() async {
    await _authRepository.logout();
    _authStatusRepository.setAuth(null);
  }

  @override
  Future<void> register(RegisterCredentialsArgs args) async {
    final AuthModel auth = await _authRepository.register(args);

    final String playerId = auth.player.id;
    final String? deviceToken =
        await _firebaseMessagingWrapper.getDeviceToken();

    final Map<String, dynamic> playerData = args.toFirebasePlayerDataMap(
      deviceToken: deviceToken,
    );
    await _playersRepository.savePlayer(
      playerId: playerId,
      playerData: playerData,
    );

    _authStatusRepository.setAuth(auth);
  }
}
