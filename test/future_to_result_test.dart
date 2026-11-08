import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flyfinder/core/domain/model/base_error.dart';
import 'package:flyfinder/core/domain/model/result.dart';
import 'package:flyfinder/extensions/future_to_result_extension.dart';

void main() {
  group('FutureToResult', () {
    group('Success', () {
      test(
        'returns ResultSuccess when Future completes successfully',
        () async {
          // Arrange
          final future = Future<int>.value(42);

          // Act
          final result = await future.asResult();

          // Assert
          expect(result, isA<ResultSuccess<int, BaseError>>());
          expect(result.maybeSuccess?.data, 42);
        },
      );
    });

    group('FirebaseException', () {
      test('maps permission-denied to FirebasePermissionError', () async {
        // Arrange
        final exception = FirebaseException(
          plugin: 'cloud_firestore',
          code: 'permission-denied',
        );

        // Act
        final result = await Future<int>.error(exception).asResult();

        // Assert
        expect(result, isA<ResultError<int, BaseError>>());
        expect(
          result.maybeError?.error,
          isA<FirebasePermissionError>(),
        );
      });

      test('maps unavailable to FirebaseUnavailableError', () async {
        // Arrange
        final exception = FirebaseException(
          plugin: 'cloud_firestore',
          code: 'unavailable',
        );

        // Act
        final result = await Future<int>.error(exception).asResult();

        // Assert
        expect(
          result.maybeError?.error,
          isA<FirebaseUnavailableError>(),
        );
      });

      test('maps unknown code to FirebaseUnknownError', () async {
        // Arrange
        final exception = FirebaseException(
          plugin: 'cloud_firestore',
          code: 'unknown-code',
        );

        // Act
        final result = await Future<int>.error(exception).asResult();

        // Assert
        expect(
          result.maybeError?.error,
          isA<FirebaseUnknownError>(),
        );
      });
    });

    group('Unexpected errors', () {
      test('rethrows TypeError in debug mode', () async {
        // Arrange
        final exception = TypeError();

        // Act & Assert
        await expectLater(
          Future<int>.error(exception).asResult(),
          throwsA(isA<TypeError>()),
        );
      });

      test('rethrows unknown exceptions', () async {
        // Arrange
        final exception = Exception('Unexpected error');

        // Act & Assert
        await expectLater(
          Future<int>.error(exception).asResult(),
          throwsA(same(exception)),
        );
      });
    });
  });
}
