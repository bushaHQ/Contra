import 'package:flutter/foundation.dart';

class ContraGenerator {
  static String generateId() {
    /// Generate code to be use for tracking each busy state
    final code = UniqueKey().hashCode;
    return code.toString();
  }
}
