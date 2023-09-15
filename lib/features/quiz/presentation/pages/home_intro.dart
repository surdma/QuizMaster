import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mcu_quiz/features/quiz/presentation/pages/quiz_screen.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_buuton.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome to QuizMaster",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Expanded(child: SvgPicture.asset("assets/images/masee.svg")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The ultimate destination for trivia enthusiasts! Embark on a journey of knowledge and fun as you explore a world of questions and answers.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),

            CustomButton(
              title: "Start Adventure",
              onPressed: () {
                Navigator.push(
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
    );
  }
}
