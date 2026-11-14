import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/extensions/map_extension.dart';

class FormChange {
  FormChange(List<Json> values)
    : previous = Map.unmodifiable(values.first),
      current = Map.unmodifiable(values.last);

  final Json previous;
  final Json current;

  FormValueChange<T> get<T>(String controlName) {
    return FormValueChange<T>(
      previous.recursiveVal(controlName) as T?,
      current.recursiveVal(controlName) as T?,
    );
  }
}

class FormValueChange<T> {
  FormValueChange(this.previous, this.current);

  final T? previous;
  final T? current;

  bool get changed => previous != current;
}
