import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcu_quiz/core/resources/data_state.dart';
import 'package:mcu_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:mcu_quiz/features/quiz/domain/entities/option_entity.dart';

import 'package:mcu_quiz/features/quiz/presentation/pages/result_screen.dart';
import 'package:mcu_quiz/features/quiz/presentation/ui_logic/quiz_state.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

import '../ui_logic/quiz_provider.dart';
import '../widgets/custom_buuton.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionTimerSeconds = 20;
  Timer? _timer;
  int questionIndex = 1;
  PageController _controller = PageController();
  int score = 0;
  List<String> optionsLetters = ["A.", "B.", "C.", "D."];
  List<QuizModel> quizzes = [];

  late QuizState quizState;

  void startTimerOnQuestions() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (questionTimerSeconds > 0) {
            questionTimerSeconds--;
          } else {
            _timer?.cancel();
            navigateToNewQestion(quizState: quizState);
          }
        });
      }
    });
  }

  void navigateToNewQestion({required QuizState quizState}) {
    if (questionIndex < quizzes.length) {
      _timer?.cancel();
      _controller.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      startTimerOnQuestions();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(quizState: quizState),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<QuizProvider>().fetchQuestions();
    startTimerOnQuestions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);

    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Consumer<QuizProvider>(
          builder: (context, value, child) {
            if (value.state is DataSuccess) {
              DataSuccess successState = value.state as DataSuccess;
              quizState = successState.data[1] as QuizState;
              quizzes = successState.data[0] as List<QuizModel>;
              return Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey,
                        Color.fromARGB(255, 176, 245, 212),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: child,
                    ),
                  ),
                ),
              );
            } else if (value.state is DataFailed) {
              return Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey,
                        Color.fromARGB(255, 176, 245, 212),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        child: Text("${value.state.error}"),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey,
                        Color.fromARGB(255, 176, 245, 212),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 26, 25, 113),
                    ),
                  ),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Quiz Project",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14, bottom: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                        weight: 2.w,
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          minHeight: 20,
                          value: 1 - (questionTimerSeconds / 20),
                          backgroundColor: Colors.blue.shade100,
                          color: Colors.blueGrey,
                          valueColor: const AlwaysStoppedAnimation(bgColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question $questionIndex/ ${quizzes.length}",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: "Poppins",
                                    fontSize: 24.sp,
                                  ),
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: quizzes.length,
                            onPageChanged: (index) {
                              setState(() {
                                questionIndex = index + 1;
                                questionTimerSeconds = 20;
                              });
                            },
                            itemBuilder: (context, index) {
                              QuizModel quiz = quizzes[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      quiz.question,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontFamily: "Poppins",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 2.5.h,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: quiz.options.length,
                                        itemBuilder: (context, optionIndex) {
                                          OptionEntity option =
                                              quiz.options[optionIndex];
                                          Color color = paintOptionBox(
                                              option: option,
                                              currentQuestion: quiz);
                                          final String letters =
                                              optionsLetters[optionIndex];
                                          var icon = paintAnswerIcon(
                                              option: option,
                                              currentQuestion: quiz);

                                          return InkWell(
                                              onTap: () {
                                                if (!quiz.isAttempted) {
                                                  context
                                                      .read<QuizProvider>()
                                                      .submitAnswer(
                                                          quiz, option);
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsetsDirectional
                                                    .symmetric(
                                                  vertical: 2.0.h,
                                                  horizontal: 2.w,
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: color,
                                                  ),
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "$letters ${option.title}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    quiz.isAttempted
                                                        ? icon
                                                        : const SizedBox
                                                            .shrink()
                                                  ],
                                                ),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CustomButton(
                            title: questionIndex < quizzes.length
                                ? 'Next Question'
                                : 'Result',
                            onPressed: () =>
                                navigateToNewQestion(quizState: quizState),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Color paintOptionBox(
      {required OptionEntity option, required QuizModel currentQuestion}) {
    final isSelected = option == currentQuestion.selectedOption;
    final isCorrect = currentQuestion.correctAnswer == option.title;
    if (currentQuestion.isAttempted) {
      if (isSelected) {
        return isCorrect ? Colors.green : Colors.red;
      } else if (isCorrect) {
        return Colors.green;
      }
    } else {
      return Colors.grey.shade200;
    }
    return Colors.grey.shade200;
  }

  Widget paintAnswerIcon(
      {required OptionEntity option, required QuizModel currentQuestion}) {
    final isSelected = option == currentQuestion.selectedOption;
    final isCorrect = currentQuestion.correctAnswer == option.title;
    Icon correctIcon = const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
    Icon wrongIcon = const Icon(
      Icons.cancel,
      color: Colors.red,
    );

    if (currentQuestion.isAttempted) {
      if (isSelected) {
        return isCorrect ? correctIcon : wrongIcon;
      } else if (isCorrect) {
        return correctIcon;
      }
    } else {
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}
