import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/core/domain/model/base_error.dart';

@immutable
class FirebaseExceptionResolver {
  const FirebaseExceptionResolver(this.err);

  @protected
  final FirebaseException err;

  FirebaseError resolve() => switch (err.code) {
    'permission-denied' => FirebasePermissionError(),
    'unauthenticated' => FirebasePermissionError(),
    'not-found' => FirebaseNotFoundError(),
    'unavailable' => FirebaseUnavailableError(),
    'deadline-exceeded' => FirebaseTimeoutError(),
    _ => FirebaseUnknownError(),
  };
}
