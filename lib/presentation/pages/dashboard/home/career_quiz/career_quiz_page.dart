import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CareerQuizPage extends StatefulWidget {
  const CareerQuizPage({super.key});

  @override
  State<CareerQuizPage> createState() => _CareerQuizPageState();
}

class _CareerQuizPageState extends State<CareerQuizPage> {
  // * Answer Choice
  final List<Map<String, dynamic>> _answerChoice = [
    {
      'answerLabel': tr(LocaleKeys.strongly_dislike),
      'answerNumber': tr(LocaleKeys.number_one),
    },
    {
      'answerLabel': tr(LocaleKeys.dislike),
      'answerNumber': tr(LocaleKeys.number_two),
    },
    {
      'answerLabel': tr(LocaleKeys.unsure),
      'answerNumber': tr(LocaleKeys.three),
    },
    {
      'answerLabel': tr(LocaleKeys.like),
      'answerNumber': tr(LocaleKeys.four),
    },
    {
      'answerLabel': tr(LocaleKeys.strongly_like),
      'answerNumber': tr(LocaleKeys.five),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.defaultSpace),
          child: Column(
            children: [
              // * Title
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Career Quiz',
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
              ),
              // * Hero Image
              Container(
                margin: const EdgeInsets.only(top: Dimen.largeSpace),
                child: Image.asset(
                  Assets.imageHero1,
                  fit: BoxFit.cover,
                ),
              ),
              // * Before We Begin
              Container(
                margin: const EdgeInsets.only(top: Dimen.contentPadding),
                child: Text(
                  tr(LocaleKeys.before_we_begin),
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
              ),
              // * Career Quiz Description
              Container(
                margin: const EdgeInsets.only(top: Dimen.contentPadding),
                child: Text(
                  tr(LocaleKeys.career_quiz_description),
                  style: CustomTextStyle.bodyTextStyle(height: 1.5),
                ),
              ),
              // * Divider
              Container(
                margin: const EdgeInsets.only(top: Dimen.contentPadding),
                child: const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              // * Career Quiz Answer Choice
              Container(
                margin: const EdgeInsets.only(top: Dimen.largeSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _answerChoice
                      .map((answer) => Expanded(
                            child: AnswerChoice(
                              answerLabel: answer['answerLabel'],
                              answerNumber: answer['answerNumber'],
                            ),
                          ))
                      .toList(),
                ),
              ),
              // * As You Answer The Questions
              Container(
                margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                child: Text(
                  tr(LocaleKeys.as_you_answer_the_question),
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
              ),
              // * Career Quiz Tip
              Container(
                margin: const EdgeInsets.only(top: Dimen.contentPadding),
                child: Text(
                  tr(LocaleKeys.career_quiz_tip),
                  style: CustomTextStyle.bodyTextStyle(height: 1.5),
                ),
              ),
              // * Start Career Quiz Button
              Container(
                margin: const EdgeInsets.only(top: Dimen.largeSpace),
                child: ElevatedButton(
                  onPressed: () => context.push(destination: const CareerQuizQuestionPage()),
                  child: Text(
                    tr(LocaleKeys.start_career_quiz),
                    style: CustomTextStyle.buttonTextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerChoice extends StatelessWidget {
  final String answerLabel;
  final String answerNumber;
  const AnswerChoice({super.key, required this.answerLabel, required this.answerNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // * Answer Label
        Text(
          answerLabel,
          style: CustomTextStyle.captionTextStyle(),
        ),
        // * Answer Number
        Container(
          margin: const EdgeInsets.only(top: Dimen.smallSpace),
          child: Text(
            answerNumber,
            style: CustomTextStyle.captionTextStyle(),
          ),
        ),
      ],
    );
  }
}
