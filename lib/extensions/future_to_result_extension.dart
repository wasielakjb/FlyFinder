import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/core/domain/misc/firebase_exception_resolver.dart';
import 'package:flyfinder/core/domain/model/base_error.dart';
import 'package:flyfinder/core/domain/model/result.dart';

extension FutureToResult<T> on Future<T> {
  Future<Result<T, BaseError>> asResult() {
    return then<Result<T, BaseError>>(
      ResultSuccess.new,
    ).catchError((Object error) {
      if (error is FirebaseException) {
        final domainError = FirebaseExceptionResolver(error).resolve();
        return ResultError<T, BaseError>(domainError);
      } else if (error is TypeError) {
        if (kDebugMode) throw error;
        return ResultError<T, BaseError>(DataParsingError());
      } else {
        throw error as Exception;
      }
    });
  }
}
