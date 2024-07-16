import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class ItemCareerQuizQuestion extends StatelessWidget {
  final int questionIndex;
  final int? chosenAnswer;
  final List<int> answerChoices;
  final Function(int? value) onChanged;
  final CareerQuizModels models;
  const ItemCareerQuizQuestion({
    super.key,
    required this.questionIndex,
    required this.chosenAnswer,
    required this.answerChoices,
    required this.onChanged,
    required this.models,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Question
        Text(
          '$questionIndex.${models.questionText}',
        ),
        // * Choice of Answer
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: answerChoices
                .map((answer) => RadioAnswerChoice(
                      chosenAnswer: chosenAnswer,
                      answerIndex: answer,
                      currentAnswer: answer,
                      onChanged: onChanged,
                    ))
                .toList()),
      ],
    );
  }
}

class RadioAnswerChoice extends StatelessWidget {
  final int? chosenAnswer;
  final int currentAnswer;
  final int answerIndex;
  final Function(int? value) onChanged;
  const RadioAnswerChoice({
    super.key,
    this.chosenAnswer,
    required this.answerIndex,
    required this.currentAnswer,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.scale(
          scale: 1,
          child: Radio<int?>(
            value: answerIndex,
            groupValue: chosenAnswer,
            onChanged: onChanged,
          ),
        ),
        Text(
          answerIndex.toString(),
          style: CustomTextStyle.bodyTextStyle(),
        )
      ],
    );
  }
}