import 'package:flyfinder/core/domain/model/json.dart';

extension JsonExtension on Json {
  dynamic recursiveVal(String key) {
    final keys = key.split('.');
    if (keys.any((k) => k.isEmpty)) return null;

    final value = this[keys.first];
    if (keys.length == 1) return value;

    if (value is Json) {
      return value.recursiveVal(keys.skip(1).join('.'));
    }

    return null;
  }
}
