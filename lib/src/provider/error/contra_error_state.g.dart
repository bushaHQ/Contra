// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contra_error_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contraErrorStateHash() => r'0bf7d2ea8be2ada460d36a5528efae0c561a8369';

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

abstract class _$ContraErrorState
    extends BuildlessAutoDisposeNotifier<Map<int, dynamic>> {
  late final String id;

  Map<int, dynamic> build(
    String id,
  );
}

/// See also [ContraErrorState].
@ProviderFor(ContraErrorState)
const contraErrorStateProvider = ContraErrorStateFamily();

/// See also [ContraErrorState].
class ContraErrorStateFamily extends Family<Map<int, dynamic>> {
  /// See also [ContraErrorState].
  const ContraErrorStateFamily();

  /// See also [ContraErrorState].
  ContraErrorStateProvider call(
    String id,
  ) {
    return ContraErrorStateProvider(
      id,
    );
  }

  @override
  ContraErrorStateProvider getProviderOverride(
    covariant ContraErrorStateProvider provider,
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
  String? get name => r'contraErrorStateProvider';
}

/// See also [ContraErrorState].
class ContraErrorStateProvider extends AutoDisposeNotifierProviderImpl<
    ContraErrorState, Map<int, dynamic>> {
  /// See also [ContraErrorState].
  ContraErrorStateProvider(
    String id,
  ) : this._internal(
          () => ContraErrorState()..id = id,
          from: contraErrorStateProvider,
          name: r'contraErrorStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contraErrorStateHash,
          dependencies: ContraErrorStateFamily._dependencies,
          allTransitiveDependencies:
              ContraErrorStateFamily._allTransitiveDependencies,
          id: id,
        );

  ContraErrorStateProvider._internal(
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
  Map<int, dynamic> runNotifierBuild(
    covariant ContraErrorState notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ContraErrorState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContraErrorStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<ContraErrorState, Map<int, dynamic>>
      createElement() {
    return _ContraErrorStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContraErrorStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ContraErrorStateRef on AutoDisposeNotifierProviderRef<Map<int, dynamic>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ContraErrorStateProviderElement
    extends AutoDisposeNotifierProviderElement<ContraErrorState,
        Map<int, dynamic>> with ContraErrorStateRef {
  _ContraErrorStateProviderElement(super.provider);

  @override
  String get id => (origin as ContraErrorStateProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
