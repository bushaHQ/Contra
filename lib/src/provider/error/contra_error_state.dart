import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contra_error_state.g.dart';

@riverpod
class ContraErrorState extends _$ContraErrorState {
  @override
  Map<int, dynamic> build(String id) {
    return {};
  }

  void setErrorForObject(Object object, dynamic value) {
    state = {...state, object.hashCode: value};
  }
}
