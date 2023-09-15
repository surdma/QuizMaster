import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:mcu_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';

import '../../../../core/exception_handler/failure.dart';
import '../../../../core/exception_handler/failure_exception.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../data_source/local_source.dart';

class QuizRepositoryImpl implements QuizRepository<QuizModel> {
  static final QuizRepositoryImpl _quizRepositoryImpl =
      QuizRepositoryImpl._internal();
  late QuizLocalDataSource _quizLocalSource;

  factory QuizRepositoryImpl() {
    _quizRepositoryImpl._quizLocalSource = QuizLocalDataSource();

    return _quizRepositoryImpl;
  }
  QuizRepositoryImpl._internal();

  @override
  Future<Either<Failure, List<QuizEntity>>> fetchQuizQuestions() async {
    try {
      List<QuizModel> dataset = await _quizLocalSource.fetchQuizQuestions();
      dataset.shuffle();
      List<QuizModel> quizzes = dataset.take(10).toList();
      return Right(quizzes);
    } catch (error) {
      return Left(FailureException(error));
    }
  }
}
