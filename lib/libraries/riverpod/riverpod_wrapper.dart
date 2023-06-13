import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/app_dependencies_manager.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/logger/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/riverpod/app_riverpod_observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverpodWrapper {
  static List<Override> getAppProvidersOverrides(
    InitializedAppDependenciesValue dependencies,
  ) {
    return [
      loggerWrapperProvider.overrideWith((ref) => dependencies.loggerWrapper),
      overlaySupportWrapperProvider
          .overrideWith((ref) => dependencies.overlaySupportWrapper),
      geocodingWrapperProvider
          .overrideWith((ref) => dependencies.geocodingWrapper),
      geolocatorWrapperProvider
          .overrideWith((ref) => dependencies.geolocatorWrapper),
      secureStorageWrapperProvider
          .overrideWith((ref) => dependencies.secureStorageWrapper),
      firebaseCoreWrapperProvider
          .overrideWith((ref) => dependencies.firebaseCoreWrapper),
      firebaseMessagingWrapperProvider
          .overrideWith((ref) => dependencies.firebaseMessagingWrapper),
      firebaseFunctionsWrapperProvider
          .overrideWith((ref) => dependencies.firebaseFunctionsWrapper),
      firebaseFirestoreWrapperProvider
          .overrideWith((ref) => dependencies.firebaseFirestoreWrapper),
      firebaseAuthWrapperProvider
          .overrideWith((ref) => dependencies.firebaseAuthWrapper),
      authLocalAppDataSourceProvider
          .overrideWith((ref) => dependencies.authLocalDataSource),
      playersRemoteAppDataSourceProvider
          .overrideWith((ref) => dependencies.playersRemoteDataSource),
      matchesRemoteAppDataSourceProvider
          .overrideWith((ref) => dependencies.matchesRemoteDataSource),
      authRemoteAppDataSourceProvider
          .overrideWith((ref) => dependencies.authRemoteDataSource),
      authStatusRepositoryProvider
          .overrideWith((ref) => dependencies.authStatusRepository),
      authRepositoryProvider.overrideWith((ref) => dependencies.authRepository),
      playersAppRepositoryProvider
          .overrideWith((ref) => dependencies.playersRepository),
      matchesRepositoryProvider
          .overrideWith((ref) => dependencies.matchesRepository),
      playerPreferencesRepositoryProvider
          .overrideWith((ref) => dependencies.playerPreferencesRepository),
      playerPreferencesServiceProvider
          .overrideWith((ref) => dependencies.playerPreferencesService),
    ];
  }

  static List<ProviderObserver> getProviderObservers(
    InitializedAppDependenciesValue dependencies,
  ) {
    return [
      AppRiverpodObserver(
        loggerWrapper: dependencies.loggerWrapper,
      )
    ];
  }
}
