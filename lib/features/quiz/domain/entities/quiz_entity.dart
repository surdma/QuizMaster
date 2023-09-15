import 'option_entity.dart';

class QuizEntity {
  final int id;
  final String question;
  final List<OptionEntity> options;
  final String correctAnswer;

  QuizEntity({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory QuizEntity.fromJson(Map<String, dynamic> data) {
    List<OptionEntity> options = [];
    data['options'].forEach((option) {
      options.add(OptionEntity.fromJson(optionText: option));
    });
    return QuizEntity(
      id: data['id'],
      question: data['Question'],
      options: options,
      correctAnswer: data['correctAnswer'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, question, options, correctAnswer];
}
