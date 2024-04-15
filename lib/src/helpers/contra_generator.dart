import 'dart:math';

class ContraGenerator {
  static String generateId() {
    //TODO use UUID;
    final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(999999);
    return '$millisecondsSinceEpoch-$random';
  }
}
