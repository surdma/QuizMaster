import 'package:dartz/dartz.dart';

import '../exception_handler/failure.dart';

abstract class UseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call({required Params params});
}
