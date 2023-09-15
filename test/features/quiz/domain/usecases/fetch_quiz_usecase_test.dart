//mock the repository abstract class
import 'package:dartz/dartz.dart';
import 'package:mcu_quiz/core/exception_handler/failure_exception.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/option_entity.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';
import 'package:mcu_quiz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:mcu_quiz/features/quiz/domain/usecases/fetch_quiz_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fetch_quiz_usecase_test.mocks.dart';

@GenerateMocks([MockQuizRepository])
class MockQuizRepository extends Mock implements QuizRepository {}

void main() {
  late FetchQuizUseCase useCase;
  late MockMockQuizRepository mockRepository;

  setUp(() {
    mockRepository = MockMockQuizRepository();
    useCase = FetchQuizUseCase(mockRepository);
  });

  group('FetchQuizUseCase', () {
    final List<QuizEntity> sampleQuizEntities = [
      QuizEntity(
        id: 1,
        question: 'What is 1+1?',
        correctAnswer: '2',
        options: [
          const OptionEntity(title: "1"),
          const OptionEntity(title: "2"),
          const OptionEntity(title: "3"),
          const OptionEntity(title: "4"),
        ],
      ),
      QuizEntity(
        id: 2,
        question: 'What is the capital of France?',
        correctAnswer: 'Paris',
        options: [
          const OptionEntity(title: "Madrid"),
          const OptionEntity(title: "Berlin"),
          const OptionEntity(title: "Paris"),
          const OptionEntity(title: "Rome"),
        ],
      ),
    ];

    test('should fetch quiz questions from the repository', () async {
      // Arrange
      when(mockRepository.fetchQuizQuestions())
          .thenAnswer((_) async => Right(sampleQuizEntities));

      // Act
      final result = await useCase(params: null);

      // Assert
      expect(result, equals(Right(sampleQuizEntities)));
      verify(mockRepository.fetchQuizQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle a failure when fetching quiz questions', () async {
      // Arrange
      final failure = FailureException('Failed to fetch quiz questions');
      when(mockRepository.fetchQuizQuestions())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await useCase(params: null);

      // Assert
      expect(result, equals(Left(failure)));
      verify(mockRepository.fetchQuizQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
