import 'package:flutter/foundation.dart';

class ContraGenerator {
  static String generateId() {
    //TODO use UUID;
    // final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    // final random = Random().nextInt(999999);

    final code = UniqueKey().hashCode;
    return code.toString();
  }
}
