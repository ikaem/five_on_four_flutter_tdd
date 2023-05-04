// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerInfoGetControllerHash() =>
    r'3c374fd47f7c1e7718067a57824b48ac4355ab8c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PlayerInfoGetController
    extends BuildlessAutoDisposeNotifier<AsyncValue<PlayerModel>> {
  late final String playerId;

  AsyncValue<PlayerModel> build(
    String playerId,
  );
}

/// See also [PlayerInfoGetController].
@ProviderFor(PlayerInfoGetController)
const playerInfoGetControllerProvider = PlayerInfoGetControllerFamily();

/// See also [PlayerInfoGetController].
class PlayerInfoGetControllerFamily extends Family<AsyncValue<PlayerModel>> {
  /// See also [PlayerInfoGetController].
  const PlayerInfoGetControllerFamily();

  /// See also [PlayerInfoGetController].
  PlayerInfoGetControllerProvider call(
    String playerId,
  ) {
    return PlayerInfoGetControllerProvider(
      playerId,
    );
  }

  @override
  PlayerInfoGetControllerProvider getProviderOverride(
    covariant PlayerInfoGetControllerProvider provider,
  ) {
    return call(
      provider.playerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerInfoGetControllerProvider';
}

/// See also [PlayerInfoGetController].
class PlayerInfoGetControllerProvider extends AutoDisposeNotifierProviderImpl<
    PlayerInfoGetController, AsyncValue<PlayerModel>> {
  /// See also [PlayerInfoGetController].
  PlayerInfoGetControllerProvider(
    this.playerId,
  ) : super.internal(
          () => PlayerInfoGetController()..playerId = playerId,
          from: playerInfoGetControllerProvider,
          name: r'playerInfoGetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerInfoGetControllerHash,
          dependencies: PlayerInfoGetControllerFamily._dependencies,
          allTransitiveDependencies:
              PlayerInfoGetControllerFamily._allTransitiveDependencies,
        );

  final String playerId;

  @override
  bool operator ==(Object other) {
    return other is PlayerInfoGetControllerProvider &&
        other.playerId == playerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<PlayerModel> runNotifierBuild(
    covariant PlayerInfoGetController notifier,
  ) {
    return notifier.build(
      playerId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
