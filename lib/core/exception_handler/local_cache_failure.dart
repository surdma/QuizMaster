import 'failure.dart';

class LocalCacheException extends Failure {
  final String message;

  const LocalCacheException(this.message);
  @override
  List<Object?> get props => [message];

  @override
  String toString() => message.toString();
}
