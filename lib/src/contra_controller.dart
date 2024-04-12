import 'package:contra/src/busy/busy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ContraController is a abstract class that is used to manage our methods
abstract class ContraController {
  /// Creates a [ContraController]
  ContraController();

  bool _isDisposed = false;

  set ref(value) => _ref = value;

  WidgetRef get ref => _ref;

  late WidgetRef _ref;

  /// Returns the busy status for an object if it exists. Returns false if not present
  bool busy(String object) {
    var element = ref.watch(busyStateHelperProvider.notifier);
    return element.busy(object);
  }

  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setBusy(String object, bool value) {
    var busy = ref.read(busyStateHelperProvider.notifier);
    return busy.setBusyForObject(object, value);
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
