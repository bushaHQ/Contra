import 'package:flutter/material.dart';

/// ContraController is a abstract class that is used to manage our methods
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
