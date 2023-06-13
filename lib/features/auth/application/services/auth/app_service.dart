import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class AuthAppService implements AuthService {
  AuthAppService({
    required AuthRepository authRepository,
    required AuthStatusRepository authStatusRepository,
    required PlayersRepository playersRepository,
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
    required PlayerPreferencesRepository playerPreferencesRepository,
  })  : _playersRepository = playersRepository,
        _authRepository = authRepository,
        _authStatusRepository = authStatusRepository,
        _playerPreferencesRepository = playerPreferencesRepository,
        _firebaseMessagingWrapper = firebaseMessagingWrapper;

  final AuthRepository _authRepository;
  final AuthStatusRepository _authStatusRepository;
  final PlayersRepository _playersRepository;
  final FirebaseMessagingWrapper _firebaseMessagingWrapper;
  final PlayerPreferencesRepository _playerPreferencesRepository;

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
      final String playerId = auth.id;

      await _playersRepository.updatePlayerDeviceToken(
        playerId: playerId,
        deviceToken: deviceToken,
      );
    }

    // TODO getting full user here to make sure we can extract preferences from them
    final bool shouldFetchFullUser = auth != null;
    if (shouldFetchFullUser) {
      final String playerId = auth.id;
      final PlayerModel player = await _playersRepository.getPlayer(playerId);

      final whatIsThisPlayer = player.email;

      final PlayerPreferencesModel playerPreferences = player.preferences;
      // TODO this would be greate to have
      // FUTURE implement one function to set all preferences if possible - not all preferencs will be avaialble from here
      // _playerPreferencesRepository.setPlayerPreferences(playerPreferences);
      // TODO this wont be needed later
      _playerPreferencesRepository
          .setPlayerRegionSize(playerPreferences.regionSize);
      _playerPreferencesRepository.setCurrentPlayer(player);

// TODO we have a better logger
      log("This is email: $whatIsThisPlayer");

      // fina

      // now we can set all preferences initially from the player
    }

// FUTURE auth should only be auth info - not actual player info
    _authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> login(LoginCredentialsArgs args) async {
    final AuthModel auth = await _authRepository.login(args);
    final PlayerModel player = await _playersRepository.getPlayer(auth.id);

    final String? deviceToken =
        await _firebaseMessagingWrapper.getDeviceToken();

    final bool shouldUpdateDeviceToken = deviceToken != null;
    if (shouldUpdateDeviceToken) {
      final String playerId = auth.id;

      await _playersRepository.updatePlayerDeviceToken(
        playerId: playerId,
        deviceToken: deviceToken,
      );
    }

    final PlayerPreferencesModel playerPreferences = player.preferences;
    // TODO this would be greate to have
    // FUTURE implement one function to set all preferences if possible - not all preferencs will be avaialble from here
    // _playerPreferencesRepository.setPlayerPreferences(playerPreferences);
    // TODO this wont be needed later
    _playerPreferencesRepository
        .setPlayerRegionSize(playerPreferences.regionSize);
    _playerPreferencesRepository.setCurrentPlayer(player);

    _authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> logout() async {
    // TODO this should be unified somewhere - somehow or not
    await _authRepository.logout();
    _authStatusRepository.setAuth(null);
  }

  @override
  Future<void> register(RegisterCredentialsArgs args) async {
    final AuthModel auth = await _authRepository.register(args);

    final String playerId = auth.id;
    final String? deviceToken =
        await _firebaseMessagingWrapper.getDeviceToken();

    final Map<String, dynamic> playerData = args.toFirebasePlayerDataMap(
      deviceToken: deviceToken,
    );
    await _playersRepository.savePlayer(
      playerId: playerId,
      playerData: playerData,
    );

    final PlayerModel player = await _playersRepository.getPlayer(auth.id);
    final PlayerPreferencesModel playerPreferences = player.preferences;
    // TODO this would be greate to have
    // FUTURE implement one function to set all preferences if possible - not all preferencs will be avaialble from here
    // _playerPreferencesRepository.setPlayerPreferences(playerPreferences);
    // TODO this wont be needed later
    _playerPreferencesRepository
        .setPlayerRegionSize(playerPreferences.regionSize);
    _playerPreferencesRepository.setCurrentPlayer(player);

    _authStatusRepository.setAuth(auth);
  }
}
