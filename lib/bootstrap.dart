import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/firebase_core_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:five_on_four_flutter_tdd/libraries/logger/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

// TODO this could be in a class called initializer somewghere

  final LoggerWrapper loggerWrapper = LoggerWrapper();
  final FirebaseCoreWrapper firebaseCoreWrapper = FirebaseCoreWrapper();
  await firebaseCoreWrapper.initialize();

  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      FirebaseMessagingWrapper();
  final OverlaySupportWrapper overlaySupportWrapper = OverlaySupportWrapper();
  final GeocodingWrapper geocodingWrapper = GeocodingWrapper();
  final GeolocatorWrapper geolocatorWrapper = GeolocatorWrapper();
  final FirebaseFunctionsWrapper firebaseFunctionsWrapper =
      FirebaseFunctionsWrapper();
  final FirebaseFirestoreWrapper firebaseFirestoreWrapper =
      FirebaseFirestoreWrapper();

  final PlayersRemoteDataSource playersRemoteDataSource =
      PlayersRemoteAppDataSource(
          firebaseFirestoreWrapper: firebaseFirestoreWrapper);

  final AuthStatusRepository authStatusRepository = AuthStatusAppRepository();
  final PlayersRepository playersRepository = PlayersAppRepository(
    playersRemoteDataSource: playersRemoteDataSource,
  );
  final PlayerPreferencesRepository playerPreferencesRepository =
      PlayerPreferencesAppRepository();

  final PlayerPreferencesService playerPreferencesService =
      PlayerPreferencesAppService(
    geocodingWrapper: geocodingWrapper,
    geolocatorWrapper: geolocatorWrapper,
    playerPreferencesRepository: playerPreferencesRepository,
    authStatusRepository: authStatusRepository,
    playersRepository: playersRepository,
  );

  // FUTURE check for better error handling if one of the initializers fails
  // await firebaseCoreWrapper.initialize();
  await firebaseMessagingWrapper.initialize();
  await playerPreferencesService.initialize();
  firebaseFunctionsWrapper.initialize();

  FlutterError.onError = (details) {
    loggerWrapper.log(
      logLevel: Level.error,
      message: "FlutterError: ${details.exception}",
      stackTrace: details.stack ?? StackTrace.current,
    );
  };

  await runZonedGuarded(
    () async {
      runApp(
        ProviderScope(
          child: overlaySupportWrapper.globalWrap(await builder()),
          overrides: [
            // TODO overriders could be moved elsewhere, to be defined there
            loggerWrapperProvider.overrideWith((ref) => loggerWrapper),
            firebaseCoreWrapperProvider
                .overrideWith((ref) => firebaseCoreWrapper),
            overlaySupportWrapperProvider
                .overrideWith((ref) => overlaySupportWrapper),
            firebaseMessagingWrapperProvider
                .overrideWith((ref) => firebaseMessagingWrapper),
            geocodingWrapperProvider.overrideWith((ref) => geocodingWrapper),
            geolocatorWrapperProvider.overrideWith((ref) => geolocatorWrapper),
            firebaseFunctionsWrapperProvider
                .overrideWith((ref) => firebaseFunctionsWrapper),
            firebaseFirestoreWrapperProvider
                .overrideWith((ref) => firebaseFirestoreWrapper),

            playersRemoteAppDataSourceProvider
                .overrideWith((ref) => playersRemoteDataSource),

            authStatusRepositoryProvider
                .overrideWith((ref) => authStatusRepository),
            playersAppRepositoryProvider
                .overrideWith((ref) => playersRepository),

            playerPreferencesRepositoryProvider
                .overrideWith((ref) => playerPreferencesRepository),
            playerPreferencesServiceProvider
                .overrideWith((ref) => playerPreferencesService),
          ],
          observers: [
            AppRiverpodObserver(
              loggerWrapper: loggerWrapper,
            )
          ],
        ),
      );
    },
    (error, stackTrace) {
      loggerWrapper.log(
        logLevel: Level.error,
        message: "Unhandled error: $error",
        stackTrace: stackTrace,
      );
    },
  );
}

class AppRiverpodObserver extends ProviderObserver {
  AppRiverpodObserver({
    required this.loggerWrapper,
  });

  final LoggerWrapper loggerWrapper;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    loggerWrapper.log(
      logLevel: Level.info,
      message: newValue.toString(),
      stackTrace: StackTrace.current,
    );

    super.didUpdateProvider(
      provider,
      previousValue,
      newValue,
      container,
    );
  }
}
