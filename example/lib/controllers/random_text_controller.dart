import 'dart:math';

import 'package:contra/contra.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomTextController extends ContraController {
  RandomTextController() : super();

  final metaObject = 'deving';

  String _generateRandomDynamicText() {
    final random = Random();
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return String.fromCharCodes(
      List.generate(
          8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );
  }

  void increment() {
    var randomText = _generateRandomDynamicText();

    ref.read(_textProvider.notifier).state = randomText;
  }

  void toggleBusyState() {
    setBusy(!isBusy);
  }

  void toggleMetaObjectBusyState() {
    setBusyForObject(metaObject, !busy(metaObject));
  }

  String get text => ref.watch(_textProvider);
}

final _textProvider = StateProvider((ref) => 'helloo');
