import 'package:mcu_quiz/features/quiz/domain/entities/quiz_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([QuizMockEntiy])
class QuizMockEntiy extends Mock implements QuizEntity {}
