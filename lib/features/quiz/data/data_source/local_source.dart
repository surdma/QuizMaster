import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mcu_quiz/core/exception_handler/local_cache_failure.dart';
import 'package:mcu_quiz/features/quiz/data/models/quiz_model.dart';

import '../../../../core/exception_handler/failure_exception.dart';

class QuizLocalDataSource {
  Future<List<QuizModel>> fetchQuizQuestions() async {
    try {
      String quizData =
          await rootBundle.loadString("assets/datasets/quiz_dataset.json");

      List<QuizModel> result = List<QuizModel>.from(
        jsonDecode(quizData).map(
          (jsonData) => QuizModel.fromJson(jsonData),
        ),
      );
      return result;
    } catch (error) {
      throw const LocalCacheException("Failed to load questions dataset");
    }
  }
}
