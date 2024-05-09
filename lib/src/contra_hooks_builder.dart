import 'package:contra/contra.dart';
import 'package:contra/src/provider/controller/contra.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContraHookViewBuilder<T extends ContraController>
    extends StatelessWidget {
  const ContraHookViewBuilder({
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
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        contraControllerProvider.overrideWith(
          (ref) => controllerBuilder.call(),
        ),
      ],
      child: _ContraHookViewBuilder(
        builder: builder,
        controllerBuilder: controllerBuilder,
        onDispose: onDispose,
        onViewReady: onViewReady,
      ),
    );
  }
}

class _ContraHookViewBuilder<T extends ContraController>
    extends StatefulHookConsumerWidget {
  const _ContraHookViewBuilder({
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
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContraViewControllerState<T>();
}

class _ContraViewControllerState<T extends ContraController>
    extends ConsumerState<_ContraHookViewBuilder<T>> {
  late T _controller;

  /// Initialize the controller
  void initializeController(WidgetRef ref) {
    _controller = ref.read(contraControllerProvider) as T;
    _controller.ref = ref;
  }

  @override
  void initState() {
    super.initState();

    /// Supply the controller to the view
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.onViewReady?.call(_controller);
      },
    );
  }

  @override
  void dispose() {
    widget.onDispose?.call(_controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeController(ref);
    return widget.builder(context, _controller);
  }
}
