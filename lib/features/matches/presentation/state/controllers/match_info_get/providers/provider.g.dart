// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchInfoGetAppControllerHash() =>
    r'dad575b6f0595fb13898714a7693d3dd94f449f6';

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

abstract class _$MatchInfoGetAppController
    extends BuildlessAutoDisposeAsyncNotifier<MatchInfoModel?> {
  late final String matchId;

  FutureOr<MatchInfoModel?> build(
    String matchId,
  );
}

/// See also [MatchInfoGetAppController].
@ProviderFor(MatchInfoGetAppController)
const matchInfoGetAppControllerProvider = MatchInfoGetAppControllerFamily();

/// See also [MatchInfoGetAppController].
class MatchInfoGetAppControllerFamily
    extends Family<AsyncValue<MatchInfoModel?>> {
  /// See also [MatchInfoGetAppController].
  const MatchInfoGetAppControllerFamily();

  /// See also [MatchInfoGetAppController].
  MatchInfoGetAppControllerProvider call(
    String matchId,
  ) {
    return MatchInfoGetAppControllerProvider(
      matchId,
    );
  }

  @override
  MatchInfoGetAppControllerProvider getProviderOverride(
    covariant MatchInfoGetAppControllerProvider provider,
  ) {
    return call(
      provider.matchId,
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
  String? get name => r'matchInfoGetAppControllerProvider';
}

/// See also [MatchInfoGetAppController].
class MatchInfoGetAppControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MatchInfoGetAppController,
        MatchInfoModel?> {
  /// See also [MatchInfoGetAppController].
  MatchInfoGetAppControllerProvider(
    this.matchId,
  ) : super.internal(
          () => MatchInfoGetAppController()..matchId = matchId,
          from: matchInfoGetAppControllerProvider,
          name: r'matchInfoGetAppControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchInfoGetAppControllerHash,
          dependencies: MatchInfoGetAppControllerFamily._dependencies,
          allTransitiveDependencies:
              MatchInfoGetAppControllerFamily._allTransitiveDependencies,
        );

  final String matchId;

  @override
  bool operator ==(Object other) {
    return other is MatchInfoGetAppControllerProvider &&
        other.matchId == matchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, matchId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<MatchInfoModel?> runNotifierBuild(
    covariant MatchInfoGetAppController notifier,
  ) {
    return notifier.build(
      matchId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
