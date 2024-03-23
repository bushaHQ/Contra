import 'package:flutter/material.dart';

/// ContraController is a abstract class that is used to manage the state of the
/// model and update the screen when the model changes.
/// M is the type of the model.
abstract class ContraController {
  /// Creates a [ContraController]
  ContraController();

  bool _isDisposed = false;

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
