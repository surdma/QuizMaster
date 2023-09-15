import 'package:dartz/dartz.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';

import '../../../../core/exception_handler/failure.dart';
import '../../../../core/usecases/usescase.dart';
import '../repositories/quiz_repository.dart';

class FetchQuizUseCase implements UseCase<List<QuizEntity>, void> {
  final QuizRepository _repository;

  FetchQuizUseCase(this._repository);

  @override
  Future<Either<Failure, List<QuizEntity>>> call({required void params}) async {
    return await _repository.fetchQuizQuestions();
  }
}
