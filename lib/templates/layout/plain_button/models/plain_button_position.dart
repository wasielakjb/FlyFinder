import 'package:flutter/material.dart';

enum PlainButtonPosition {
  first,
  last,
  middle,
  single;

  static PlainButtonPosition fromIndex({
    required int index,
    required int count,
  }) {
    if (count <= 1) return single;
    if (index == 0) return first;
    if (index == count - 1) return last;
    return middle;
  }

  BorderRadius toBorderRadius() => switch (this) {
    PlainButtonPosition.first => const BorderRadius.vertical(
      top: Radius.circular(8),
    ),
    PlainButtonPosition.last => const BorderRadius.vertical(
      bottom: Radius.circular(8),
    ),
    PlainButtonPosition.single => BorderRadius.circular(8),
    _ => BorderRadius.zero,
  };
}
