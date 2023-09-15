import 'package:dartz/dartz.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';

import '../../../../core/exception_handler/failure.dart';

abstract class QuizRepository<T> {
  Future<Either<Failure, List<QuizEntity>>> fetchQuizQuestions();
}
