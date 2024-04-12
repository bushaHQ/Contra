import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'busy_state.g.dart';

@riverpod
class BusyStateHelper extends _$BusyStateHelper {
  @override
  Map<int, bool> build() {
    return _busyStates;
  }

  final Map<int, bool> _busyStates = <int, bool>{};

  /// Returns the busy status for an object if it exists. Returns false if not present
  bool busy(Object? object) => state[object.hashCode] ?? false;

  // /// Returns the busy status of the ViewModel
  // bool get isBusy => busy(this);

  // Returns true if any objects still have a busy status that is true.
  bool get anyObjectsBusy => _busyStates.values.any((busy) => busy);

  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setBusyForObject(Object? object, bool value) {
    _busyStates[object.hashCode] = value;
    state[object.hashCode] = value;
  }
}
