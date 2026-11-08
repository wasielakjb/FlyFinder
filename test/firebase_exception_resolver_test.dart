import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flyfinder/core/domain/misc/firebase_exception_resolver.dart';
import 'package:flyfinder/core/domain/model/base_error.dart';

void main() {
  group('FirebaseExceptionResolver', () {
    test('resolves permission-denied to FirebasePermissionError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'permission-denied',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebasePermissionError>());
    });

    test('resolves unauthenticated to FirebasePermissionError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'unauthenticated',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebasePermissionError>());
    });

    test('resolves not-found to FirebaseNotFoundError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'not-found',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebaseNotFoundError>());
    });

    test('resolves unavailable to FirebaseUnavailableError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'unavailable',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebaseUnavailableError>());
    });

    test('resolves deadline-exceeded to FirebaseTimeoutError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'deadline-exceeded',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebaseTimeoutError>());
    });

    test('resolves unknown code to FirebaseUnknownError', () {
      final exception = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'some-unknown-code',
      );

      final result = FirebaseExceptionResolver(exception).resolve();

      expect(result, isA<FirebaseUnknownError>());
    });
  });
}
