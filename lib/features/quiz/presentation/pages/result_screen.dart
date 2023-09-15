import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcu_quiz/features/quiz/presentation/pages/quiz_screen.dart';
import 'package:mcu_quiz/features/quiz/presentation/ui_logic/quiz_state.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_buuton.dart';

class ResultScreen extends StatelessWidget {
  final QuizState quizState;
  const ResultScreen({super.key, required this.quizState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: 100.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey,
              Color.fromARGB(255, 176, 245, 212),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Your Result on QUIZMASTER",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: kElevationToShadow[1],
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Attempted",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: "Poppins",
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          Text(
                            "${quizState.attempt}/${quizState.totalQuestions}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: "Poppins",
                                  fontSize:
                                      MediaQuery.of(context).size.width * .045,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: kElevationToShadow[1],
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Correct",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          Text(
                            "${quizState.score}/${quizState.totalQuestions}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: "Poppins",
                                  fontSize:
                                      MediaQuery.of(context).size.width * .045,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: "Try Again",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
