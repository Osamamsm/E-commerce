import 'dart:async';
import 'dart:io';

import 'package:e_commerce/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExceptionMapper {
  static Failure mapExceptionToFailure(Object error) {
    if (error is AuthRetryableFetchException ||
        error is SocketException ||
        error is TimeoutException ||
        error is HttpException) {
      return NetworkFailure();
    } else if (error is AuthException) {
      return AuthFailure(error.message);
    } else if (error is PostgrestException) {
      return ServerFailure(error.message);
    } else if (error is StorageException) {
      return ServerFailure(error.message);
    } else {
      return UnknownFailure();
    }
  }
}
