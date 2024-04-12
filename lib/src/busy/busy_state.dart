import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusyState extends StateNotifier<Map<int, bool>> {
  BusyState() : super({});

  bool isBusy(Object? object) => state[object.hashCode] ?? false;

  void setBusyForObject(Object? object, bool value) {
    state = {...state, object.hashCode: value};
  }
}

final busyStateProvider = StateNotifierProvider((ref) => BusyState());
