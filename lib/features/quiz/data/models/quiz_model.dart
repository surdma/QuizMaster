import 'package:mcu_quiz/features/quiz/domain/entities/option_entity.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  bool isCorrect;
  bool isAttempted;
  OptionEntity? selectedOption;
  QuizModel(
      {required super.id,
      required super.question,
      required super.correctAnswer,
      this.isCorrect = false,
      this.isAttempted = false,
      this.selectedOption,
      required super.options});

  factory QuizModel.fromJson(Map<String, dynamic> data) {
    List<OptionEntity> options = [];
    data['options'].forEach((option) {
      options.add(OptionEntity.fromJson(optionText: option));
    });
    return QuizModel(
      id: data['id'],
      question: data['Question'],
      options: options,
      correctAnswer: data['correctAnswer'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'options': options,
        'correctAnswer': correctAnswer,
      };
}
