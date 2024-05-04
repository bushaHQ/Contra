import 'package:contra/contra.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends ContraController {
  CounterController() : super();

  final metaObject = 'deving';

  final user = useState('Intial');

  void increment() {
    user.value = 'Not age';
    ref.read(counterProvider.notifier).state++;
  }

  void toggleBusyState() {
    setBusy(!isBusy);
  }

  void toggleMetaObjectBusyState() {
    setBusyForObject(metaObject, !busy(metaObject));
  }

  int get counter => ref.watch(counterProvider);
}

final counterProvider = StateProvider<int>((ref) => 0);
