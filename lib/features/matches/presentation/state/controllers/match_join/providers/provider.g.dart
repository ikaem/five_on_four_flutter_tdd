// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchJoinAppControllerHash() =>
    r'3725712524b526a03e05ab366c10bb54ec99fe49';

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
  late final void Function() onMatchJoinAction;

  AsyncValue<void> build({
    required MatchModel match,
    required void Function() onMatchJoinAction,
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
    required void Function() onMatchJoinAction,
  }) {
    return MatchJoinAppControllerProvider(
      match: match,
      onMatchJoinAction: onMatchJoinAction,
    );
  }

  @override
  MatchJoinAppControllerProvider getProviderOverride(
    covariant MatchJoinAppControllerProvider provider,
  ) {
    return call(
      match: provider.match,
      onMatchJoinAction: provider.onMatchJoinAction,
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
    required this.onMatchJoinAction,
  }) : super.internal(
          () => MatchJoinAppController()
            ..match = match
            ..onMatchJoinAction = onMatchJoinAction,
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
  final void Function() onMatchJoinAction;

  @override
  bool operator ==(Object other) {
    return other is MatchJoinAppControllerProvider &&
        other.match == match &&
        other.onMatchJoinAction == onMatchJoinAction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, match.hashCode);
    hash = _SystemHash.combine(hash, onMatchJoinAction.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<void> runNotifierBuild(
    covariant MatchJoinAppController notifier,
  ) {
    return notifier.build(
      match: match,
      onMatchJoinAction: onMatchJoinAction,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
