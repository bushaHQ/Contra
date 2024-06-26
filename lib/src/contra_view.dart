import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src.dart';

/// Base class for [ContraView].
abstract class ContraView<C extends ContraController>
    extends ContraViewController {
  /// Base constructor for [ContraView].
  const ContraView(
    this.controller, {
    super.key,
  });

  /// [ContraView] controller, we can use this to progate things later, such us intializing.
  final C controller;

  @override
  void supplyRef(WidgetRef value) {
    controller.ref = value;
  }

  @override
  void disposeController() {
    controller.dispose();
  }

  /// Function will be called when he model from [controller] changes.
  @override
  @protected
  Widget build(BuildContext context);
}
