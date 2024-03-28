import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ContraViewController extends ConsumerStatefulWidget {
  const ContraViewController({super.key});

  @protected
  Widget build(BuildContext contex);

  @protected
  void supplyRef(WidgetRef value);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContraViewControllerState();
}

class _ContraViewControllerState extends ConsumerState<ContraViewController> {
  @override
  Widget build(BuildContext context) {
    (widget).supplyRef(ref);
    return (widget).build(context);
  }
}
