import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mcu_quiz/core/exception_handler/server_failure.dart';

import 'failure.dart';
import 'local_cache_failure.dart';

// class FailureException extends Failure {
//   final String message;

//   const FailureException(this.message);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [message];
// }

class FailureException<T> extends Failure {
  final T error;
  const FailureException(this.error);

  @override
  List<Object?> get props => [error];

  ({String message, int? statuCode}) get showError {
    if (error is DioException) {
      DioException err = error as DioException;
      return (
        message: "${err.message}",
        statuCode: err.response != null ? err.response!.statusCode! : 126,
      );
    } else if (error is LocalCacheException) {
      LocalCacheException err = error as LocalCacheException;
      return (message: err.message, statuCode: null);
    } else if (error is ServerException) {
      ServerException err = error as ServerException;
      return (message: err.message, statuCode: err.statusCode);
    } else if (error is SocketException) {
      SocketException err = error as SocketException;
      return (message: err.message, statuCode: null);
    } else if (error is HandshakeException) {
      HandshakeException err = error as HandshakeException;
      return (message: err.message, statuCode: null);
    } else {
      return (message: error.toString(), statuCode: null);
    }
  }
}
