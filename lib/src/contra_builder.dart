import 'package:contra/contra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContraViewBuilder<T extends ContraController> extends ConsumerStatefulWidget {
  const ContraViewBuilder({
    super.key,
    required this.builder,
    required this.controllerBuilder,
    this.onViewReady,
    this.onDispose,
  });

  /// Function will be called when the [ContraController] is ready to be used.
  final Function(T controller)? onViewReady;

  /// Function will be called when the widget element has been dispose
  final Function(T controller)? onDispose;

  /// [ContraView] controller, we can use this to progate things later, such us intializing.
  final T Function() controllerBuilder;

  final Widget Function(BuildContext context, T controller) builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContraViewControllerState<T>();
}

class _ContraViewControllerState<T extends ContraController>
    extends ConsumerState<ContraViewBuilder<T>> {
  late T _controller;

  /// Initialize the controller
  void initializeController(WidgetRef ref) {
    _controller = widget.controllerBuilder();
    _controller.ref = ref;

    /// Supply the controller to the view
    widget.onViewReady?.call(_controller);
  }

  @override
  void initState() {
    super.initState();
    initializeController(ref);
  }

  @override
  void dispose() {
    widget.onDispose?.call(_controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}
