import 'package:contra/src/provider/busy/contra_busy_state.dart';
import 'package:contra/src/helpers/contra_generator.dart';
import 'package:contra/src/provider/error/contra_error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContraController extends _ContraControllerMain {}

/// ContraController is a abstract class that is used to manage our methods
abstract class _ContraControllerMain {
  /// Creates a [_ContraControllerMain]
  _ContraControllerMain() {
    /// thinking of using hashcode as an id
    /// let's see how it goes.
    _id = ContraGenerator.generateId();
  }

  bool _isDisposed = false;

  set ref(value) => _ref = value;

  WidgetRef get ref => _ref;

  late WidgetRef _ref;

  late String _id;

  bool _hasError(Object object) {
    return ref
            .watch(contraErrorStateProvider(_id))[object.hashCode]
            ?.isNotEmpty ??
        false;
  }

  bool get hasError => _hasError(this);

  bool hasObjectError(Object object) {
    return _hasError(object);
  }

  dynamic _getError(Object object) {
    return ref.watch(contraErrorStateProvider(_id))[object.hashCode];
  }

  dynamic get controllerError => _getError(this);

  dynamic objectError(Object object) {
    return _getError(object);
  }

  void setErrorForObject(Object object, dynamic value) {
    var error = ref.read(
      contraErrorStateProvider(_id).notifier,
    );
    error.setErrorForObject(object, value);
  }

  void setError(dynamic value) {
    setErrorForObject(this, value);
  }

  // Returns the busy status for the given object. If the object is present, it returns its busy status, otherwise it returns false.
  bool _isBusy(Object object) {
    return ref.watch(contraBusyStateProvider(_id))[object.hashCode] ?? false;
  }

  // Returns the busy status for the current ContraController object.
  bool get isBusy => _isBusy(this);

  // Returns the busy status for the given object.
  bool busy(Object object) {
    return _isBusy(object);
  }

  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value

  void setBusyForObject(Object object, bool value) {
    var busy = ref.read(
      contraBusyStateProvider(_id).notifier,
    );

    busy.setBusyForObject(object, value);
  }

  // Sets the busy state of the current object to the specified value and notifies listeners.

  void setBusy(bool value) {
    setBusyForObject(this, value);
  }

  // Executes a future while setting the busy state for the provided object, then returns the result.

  Future<T> runBusyFuture<T>(
    Future<T> busyFuture, {
    Object? busyObject,
    bool throwException = false,
  }) async {
    setBusyForObject(busyObject ?? this, true);
    try {
      var value = await busyFuture;
      return value;
    } catch (e) {
      if (throwException) rethrow;
      return Future.value(null);
    } finally {
      setBusyForObject(busyObject ?? this, false);
    }
  }

  /// Called when this object is removed from the tree permanently.
  /// The framework calls this method when this [State] object will never
  /// build again. After the framework calls [dispose].
  @mustCallSuper
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;
    }
  }
}
