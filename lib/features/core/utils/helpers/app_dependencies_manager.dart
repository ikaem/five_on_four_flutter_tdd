import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/firebase_core_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/secure_storage_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';

abstract class AppDependenciesManager {
  static Future<InitializedAppDependenciesValue>
      getInitializedDependencies() async {
    // services
    final LoggerWrapper loggerWrapper = LoggerWrapper();
    final OverlaySupportWrapper overlaySupportWrapper = OverlaySupportWrapper();
    final GeocodingWrapper geocodingWrapper = GeocodingWrapper();
    final GeolocatorWrapper geolocatorWrapper = GeolocatorWrapper();
    final SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();

    // firebase
    final FirebaseCoreWrapper firebaseCoreWrapper = FirebaseCoreWrapper();
    await firebaseCoreWrapper.initialize();

    final FirebaseMessagingWrapper firebaseMessagingWrapper =
        FirebaseMessagingWrapper();
    await firebaseMessagingWrapper.initialize();

    final FirebaseFunctionsWrapper firebaseFunctionsWrapper =
        FirebaseFunctionsWrapper();
    firebaseFunctionsWrapper.initialize();

    final FirebaseFirestoreWrapper firebaseFirestoreWrapper =
        FirebaseFirestoreWrapper();
    final FirebaseAuthWrapper firebaseAuthWrapper = FirebaseAuthWrapper();

    // data sources
    final AuthLocalDataSource authLocalDataSource = AuthLocalAppDataSource(
      secureStorageWrapper: secureStorageWrapper,
    );
    final PlayersRemoteDataSource playersRemoteDataSource =
        PlayersRemoteAppDataSource(
            firebaseFirestoreWrapper: firebaseFirestoreWrapper);
    final MatchesRemoteDataSource matchesRemoteDataSource =
        MatchesRemoteAppDataSource(
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
    );
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteAppDataSource(
      firebaseAuthWrapper: firebaseAuthWrapper,
    );

    // repositories
    final AuthStatusRepository authStatusRepository = AuthStatusAppRepository();
    final AuthRepository authRepository = AuthAppRepository(
      remoteDataSource: authRemoteDataSource,
      localDataSource: authLocalDataSource,
    );
    final PlayersRepository playersRepository = PlayersAppRepository(
      playersRemoteDataSource: playersRemoteDataSource,
    );
    final MatchesRepository matchesRepository = MatchesAppRepository(
      remoteDataSource: matchesRemoteDataSource,
    );
    final PlayerPreferencesRepository playerPreferencesRepository =
        PlayerPreferencesAppRepository();

    // services
    final PlayerPreferencesService playerPreferencesService =
        PlayerPreferencesAppService(
      geocodingWrapper: geocodingWrapper,
      geolocatorWrapper: geolocatorWrapper,
      playerPreferencesRepository: playerPreferencesRepository,
      authStatusRepository: authStatusRepository,
      playersRepository: playersRepository,
      matchesRepository: matchesRepository,
      authRepository: authRepository,
    );
    await playerPreferencesService.initialize();

    final InitializedAppDependenciesValue dependenciesValue =
        InitializedAppDependenciesValue(
      loggerWrapper: loggerWrapper,
      firebaseCoreWrapper: firebaseCoreWrapper,
      firebaseMessagingWrapper: firebaseMessagingWrapper,
      overlaySupportWrapper: overlaySupportWrapper,
      geocodingWrapper: geocodingWrapper,
      geolocatorWrapper: geolocatorWrapper,
      firebaseFunctionsWrapper: firebaseFunctionsWrapper,
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
      firebaseAuthWrapper: firebaseAuthWrapper,
      secureStorageWrapper: secureStorageWrapper,
      playersRemoteDataSource: playersRemoteDataSource,
      matchesRemoteDataSource: matchesRemoteDataSource,
      authRemoteDataSource: authRemoteDataSource,
      authLocalDataSource: authLocalDataSource,
      authStatusRepository: authStatusRepository,
      authRepository: authRepository,
      playersRepository: playersRepository,
      matchesRepository: matchesRepository,
      playerPreferencesRepository: playerPreferencesRepository,
      playerPreferencesService: playerPreferencesService,
    );

    return dependenciesValue;
  }
}

// TODO move to values
class InitializedAppDependenciesValue {
  const InitializedAppDependenciesValue({
    required this.loggerWrapper,
    required this.firebaseCoreWrapper,
    required this.firebaseMessagingWrapper,
    required this.overlaySupportWrapper,
    required this.geocodingWrapper,
    required this.geolocatorWrapper,
    required this.firebaseFunctionsWrapper,
    required this.firebaseFirestoreWrapper,
    required this.firebaseAuthWrapper,
    required this.secureStorageWrapper,
    required this.playersRemoteDataSource,
    required this.matchesRemoteDataSource,
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.authStatusRepository,
    required this.authRepository,
    required this.playersRepository,
    required this.matchesRepository,
    required this.playerPreferencesRepository,
    required this.playerPreferencesService,
  });

  final LoggerWrapper loggerWrapper;
  final FirebaseCoreWrapper firebaseCoreWrapper;
  final FirebaseMessagingWrapper firebaseMessagingWrapper;
  final OverlaySupportWrapper overlaySupportWrapper;
  final GeocodingWrapper geocodingWrapper;
  final GeolocatorWrapper geolocatorWrapper;
  final FirebaseFunctionsWrapper firebaseFunctionsWrapper;
  final FirebaseFirestoreWrapper firebaseFirestoreWrapper;
  final FirebaseAuthWrapper firebaseAuthWrapper;
  final SecureStorageWrapper secureStorageWrapper;

  final PlayersRemoteDataSource playersRemoteDataSource;
  final MatchesRemoteDataSource matchesRemoteDataSource;
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  final AuthStatusRepository authStatusRepository;
  final AuthRepository authRepository;

  final PlayersRepository playersRepository;
  final MatchesRepository matchesRepository;

  final PlayerPreferencesRepository playerPreferencesRepository;

  final PlayerPreferencesService playerPreferencesService;
}
