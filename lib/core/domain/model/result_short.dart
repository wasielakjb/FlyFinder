import 'package:flyfinder/core/domain/model/base_error.dart';
import 'package:flyfinder/core/domain/model/result.dart' as r;

typedef Result<T> = r.Result<T, BaseError>;

typedef ResultSuccess<T> = r.ResultSuccess<T, BaseError>;

typedef ResultError<T> = r.ResultError<T, BaseError>;
