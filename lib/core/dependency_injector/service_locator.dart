import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mcu_quiz/features/quiz/data/data_source/local_source.dart';
import 'package:mcu_quiz/features/quiz/data/data_source/remote_source.dart';
import 'package:mcu_quiz/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:mcu_quiz/features/quiz/domain/usecases/fetch_quiz_usecase.dart';
import 'package:mcu_quiz/features/quiz/presentation/ui_logic/quiz_provider.dart';

import '../../features/quiz/domain/repositories/quiz_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencyInjector() async {
  serviceLocator.registerSingleton<Dio>(Dio());

  serviceLocator.registerSingleton<QuizLocalDataSource>(QuizLocalDataSource());
  serviceLocator.registerSingleton<QuizRepository>(QuizRepositoryImpl());

  serviceLocator
      .registerSingleton<FetchQuizUseCase>(FetchQuizUseCase(serviceLocator()));

  serviceLocator
      .registerFactory<QuizProvider>(() => QuizProvider(serviceLocator()));
}
