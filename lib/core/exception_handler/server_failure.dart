import 'failure.dart';

class ServerException extends Failure {
  final String message;
  final int statusCode;

  const ServerException({required this.message, required this.statusCode});
  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];

  @override
  String toString() => message.toString();
}
