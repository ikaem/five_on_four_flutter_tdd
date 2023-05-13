// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playersSearchAppControllerHash() =>
    r'32068e63508f2e48447f53b1522ecfe3755eeacc';

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

abstract class _$PlayersSearchAppController
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<PlayerModel>>> {
  late final PlayersSearchOptions options;

  AsyncValue<List<PlayerModel>> build(
    PlayersSearchOptions options,
  );
}

/// See also [PlayersSearchAppController].
@ProviderFor(PlayersSearchAppController)
const playersSearchAppControllerProvider = PlayersSearchAppControllerFamily();

/// See also [PlayersSearchAppController].
class PlayersSearchAppControllerFamily
    extends Family<AsyncValue<List<PlayerModel>>> {
  /// See also [PlayersSearchAppController].
  const PlayersSearchAppControllerFamily();

  /// See also [PlayersSearchAppController].
  PlayersSearchAppControllerProvider call(
    PlayersSearchOptions options,
  ) {
    return PlayersSearchAppControllerProvider(
      options,
    );
  }

  @override
  PlayersSearchAppControllerProvider getProviderOverride(
    covariant PlayersSearchAppControllerProvider provider,
  ) {
    return call(
      provider.options,
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
  String? get name => r'playersSearchAppControllerProvider';
}

/// See also [PlayersSearchAppController].
class PlayersSearchAppControllerProvider
    extends AutoDisposeNotifierProviderImpl<PlayersSearchAppController,
        AsyncValue<List<PlayerModel>>> {
  /// See also [PlayersSearchAppController].
  PlayersSearchAppControllerProvider(
    this.options,
  ) : super.internal(
          () => PlayersSearchAppController()..options = options,
          from: playersSearchAppControllerProvider,
          name: r'playersSearchAppControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playersSearchAppControllerHash,
          dependencies: PlayersSearchAppControllerFamily._dependencies,
          allTransitiveDependencies:
              PlayersSearchAppControllerFamily._allTransitiveDependencies,
        );

  final PlayersSearchOptions options;

  @override
  bool operator ==(Object other) {
    return other is PlayersSearchAppControllerProvider &&
        other.options == options;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, options.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<List<PlayerModel>> runNotifierBuild(
    covariant PlayersSearchAppController notifier,
  ) {
    return notifier.build(
      options,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
