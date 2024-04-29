// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contra_busy_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contraBusyStateHash() => r'93d0ab5e2117da2574524866e7b7d0408fe2203e';

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

abstract class _$ContraBusyState
    extends BuildlessAutoDisposeNotifier<Map<int, bool>> {
  late final String id;

  Map<int, bool> build(
    String id,
  );
}

/// See also [ContraBusyState].
@ProviderFor(ContraBusyState)
const contraBusyStateProvider = ContraBusyStateFamily();

/// See also [ContraBusyState].
class ContraBusyStateFamily extends Family<Map<int, bool>> {
  /// See also [ContraBusyState].
  const ContraBusyStateFamily();

  /// See also [ContraBusyState].
  ContraBusyStateProvider call(
    String id,
  ) {
    return ContraBusyStateProvider(
      id,
    );
  }

  @override
  ContraBusyStateProvider getProviderOverride(
    covariant ContraBusyStateProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'contraBusyStateProvider';
}

/// See also [ContraBusyState].
class ContraBusyStateProvider
    extends AutoDisposeNotifierProviderImpl<ContraBusyState, Map<int, bool>> {
  /// See also [ContraBusyState].
  ContraBusyStateProvider(
    String id,
  ) : this._internal(
          () => ContraBusyState()..id = id,
          from: contraBusyStateProvider,
          name: r'contraBusyStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contraBusyStateHash,
          dependencies: ContraBusyStateFamily._dependencies,
          allTransitiveDependencies:
              ContraBusyStateFamily._allTransitiveDependencies,
          id: id,
        );

  ContraBusyStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Map<int, bool> runNotifierBuild(
    covariant ContraBusyState notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ContraBusyState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContraBusyStateProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ContraBusyState, Map<int, bool>>
      createElement() {
    return _ContraBusyStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContraBusyStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ContraBusyStateRef on AutoDisposeNotifierProviderRef<Map<int, bool>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ContraBusyStateProviderElement
    extends AutoDisposeNotifierProviderElement<ContraBusyState, Map<int, bool>>
    with ContraBusyStateRef {
  _ContraBusyStateProviderElement(super.provider);

  @override
  String get id => (origin as ContraBusyStateProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
