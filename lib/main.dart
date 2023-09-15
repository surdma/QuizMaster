import 'package:flutter/material.dart';
import 'package:mcu_quiz/features/quiz/presentation/pages/main_window.dart';

import 'core/dependency_injector/service_locator.dart';

void main() {
  initializeDependencyInjector();
  runApp(const MainWindow());
}
