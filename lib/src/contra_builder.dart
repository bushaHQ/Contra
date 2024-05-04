import 'package:contra/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContraViewBuilder<T extends ContraController> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        contraControllerProvider.overrideWith(
          (ref) => controllerBuilder.call(),
        ),
      ],
      child: _ContraViewBuilder(
        builder: builder,
        controllerBuilder: controllerBuilder,
        onDispose: onDispose,
        onViewReady: onViewReady,
      ),
    );
  }
}

class _ContraViewBuilder<T extends ContraController>
    extends StatefulHookConsumerWidget {
  const _ContraViewBuilder({
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
    extends ConsumerState<_ContraViewBuilder<T>> {
  late T _controller;

  /// Initialize the controller
  void initializeController(WidgetRef ref) {
    _controller = ref.read(contraControllerProvider) as T;
    _controller.ref = ref;
  }

  @override
  void initState() {
    callBack();
    super.initState();
  }

  void callBack() {
    /// Supply the controller to the view
    WidgetsBinding.instance.addPersistentFrameCallback(
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

abstract class ContraWidget<T extends ContraController>
    extends ConsumerStatefulWidget {
  const ContraWidget({super.key});

  @protected
  Widget build(BuildContext context, T controller);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContraWidgetState();
}

class _ContraWidgetState extends ConsumerState<ContraWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.read(contraControllerProvider);

    return widget.build(context, controller);
  }
}
