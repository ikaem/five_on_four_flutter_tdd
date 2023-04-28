// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchJoinAppControllerHash() =>
    r'c7bda35ff4ef00c64ca0d0a9488c65bbecc34239';

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

abstract class _$MatchJoinAppController
    extends BuildlessAutoDisposeNotifier<AsyncValue<void>> {
  late final MatchModel match;

  AsyncValue<void> build({
    required MatchModel match,
  });
}

/// See also [MatchJoinAppController].
@ProviderFor(MatchJoinAppController)
const matchJoinAppControllerProvider = MatchJoinAppControllerFamily();

/// See also [MatchJoinAppController].
class MatchJoinAppControllerFamily extends Family<AsyncValue<void>> {
  /// See also [MatchJoinAppController].
  const MatchJoinAppControllerFamily();

  /// See also [MatchJoinAppController].
  MatchJoinAppControllerProvider call({
    required MatchModel match,
  }) {
    return MatchJoinAppControllerProvider(
      match: match,
    );
  }

  @override
  MatchJoinAppControllerProvider getProviderOverride(
    covariant MatchJoinAppControllerProvider provider,
  ) {
    return call(
      match: provider.match,
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
  String? get name => r'matchJoinAppControllerProvider';
}

/// See also [MatchJoinAppController].
class MatchJoinAppControllerProvider extends AutoDisposeNotifierProviderImpl<
    MatchJoinAppController, AsyncValue<void>> {
  /// See also [MatchJoinAppController].
  MatchJoinAppControllerProvider({
    required this.match,
  }) : super.internal(
          () => MatchJoinAppController()..match = match,
          from: matchJoinAppControllerProvider,
          name: r'matchJoinAppControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchJoinAppControllerHash,
          dependencies: MatchJoinAppControllerFamily._dependencies,
          allTransitiveDependencies:
              MatchJoinAppControllerFamily._allTransitiveDependencies,
        );

  final MatchModel match;

  @override
  bool operator ==(Object other) {
    return other is MatchJoinAppControllerProvider && other.match == match;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, match.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<void> runNotifierBuild(
    covariant MatchJoinAppController notifier,
  ) {
    return notifier.build(
      match: match,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
