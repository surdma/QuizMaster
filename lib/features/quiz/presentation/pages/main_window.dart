import 'package:flutter/material.dart';

import 'package:mcu_quiz/features/quiz/presentation/ui_logic/quiz_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/dependency_injector/service_locator.dart';
import 'home_intro.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizProvider>(
      create: (context) => serviceLocator(),
      child: Sizer(
        builder: (context, orientation, deviceType) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: HomeIntro(),
          ),
        ),
      ),
    );
  }
}
