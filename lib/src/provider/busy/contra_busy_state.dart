import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contra_busy_state.g.dart';

@Riverpod()
class ContraBusyState extends _$ContraBusyState {
  @override
  Map<int, bool> build(String id) {
    return {};
  }

  void setBusyForObject(Object object, bool value) {
    state = {...state, object.hashCode: value};
  }
}
