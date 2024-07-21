import 'package:dropoff/src/core/utils/app_responses.dart';
import 'package:either_dart/either.dart';

typedef AsyncApiErrorOr<T> = Future<Either<ApiError, T>>;
