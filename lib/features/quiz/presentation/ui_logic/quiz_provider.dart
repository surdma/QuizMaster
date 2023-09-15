import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mcu_quiz/core/resources/data_state.dart';
import 'package:mcu_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/option_entity.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';
import 'package:mcu_quiz/features/quiz/domain/usecases/fetch_quiz_usecase.dart';
import 'package:mcu_quiz/features/quiz/presentation/ui_logic/quiz_state.dart';

import '../../../../core/exception_handler/failure.dart';

class QuizProvider extends ChangeNotifier {
  final FetchQuizUseCase _fetchQuizUseCase;

  QuizProvider(this._fetchQuizUseCase) {
    fetchQuestions();
  }

  late QuizState _quizState;

  List<QuizModel> _questions = [];
  late DataState _state;
  DataState get state => _state;

  List<QuizModel> get questions => _questions;
  QuizState get quizState => _quizState;
  var failResult;

  void fetchQuestions() async {
    _state = DataStateLoading();

    Either<Failure, List<QuizEntity>> result =
        await _fetchQuizUseCase(params: null);

    result.fold(
      <FailureException>(failure) {
        _state = DataFailed(failure);
      },
      (success) {
        _questions = List.from(success.map((quiz) => QuizModel(
            id: quiz.id,
            question: quiz.question,
            correctAnswer: quiz.correctAnswer,
            options: quiz.options)));

        _quizState = QuizState(
          totalQuestions: _questions.length,
          attempt: 0,
          score: 0,
        );

        _state = DataSuccess([_questions, _quizState]);
      },
    );

    notifyListeners();
  }

  void submitAnswer(QuizModel currentQuiz, OptionEntity selectedOption) {
    _quizState.attempt++;
    currentQuiz.isAttempted = true;
    currentQuiz.selectedOption = selectedOption;
    if (selectedOption.title == currentQuiz.correctAnswer) {
      currentQuiz.isCorrect = true;
      _quizState.score++;
    }

    notifyListeners();
  }
}
