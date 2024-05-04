import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ContraViewController extends ConsumerStatefulWidget {
  const ContraViewController({super.key});

  @protected
  Widget build(BuildContext contex);

  @protected
  void supplyRef(WidgetRef value);

  @protected
  void disposeController();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContraViewControllerState();
}

class _ContraViewControllerState extends ConsumerState<ContraViewController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.supplyRef(ref);
    return (widget).build(context);
  }
}
