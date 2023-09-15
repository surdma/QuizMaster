import 'package:mcu_quiz/core/exception_handler/failure.dart';

abstract class DataState<T> {
  final T? data;
  final Failure? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  ///  DataSuccess Class is an extension of DataState.
  ///   The Main Purpose of it is to return The avialable that to the ui state  provieded their is no failure.

  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(Failure error) : super(error: error);
}

class DataStateLoading<T> extends DataState<T> {
  DataStateLoading() : super();
}
