import 'package:flutter/material.dart';

abstract class ContraViewController extends Widget {
  const ContraViewController({super.key});

  @protected
  Widget build(BuildContext context);

  @override
  ComponentElement createElement() => _MViewCElement(this);
}

class _MViewCElement extends ComponentElement {
  _MViewCElement(ContraViewController super.widget);

  @override
  Widget build() => (widget as ContraViewController).build(this);

  @override
  void update(Widget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget, 'widget != newWidget');
    rebuild(force: true);
  }
}
