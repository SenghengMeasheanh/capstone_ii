import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/items/item_career_quiz_question.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CareerQuizQuestionPage extends StatefulWidget {
  const CareerQuizQuestionPage({super.key});

  @override
  State<CareerQuizQuestionPage> createState() => _CareerQuizQuestionPageState();
}

class _CareerQuizQuestionPageState extends State<CareerQuizQuestionPage> {
  // * Pagination Controller
  final _pagingController = PagingController<int, CareerQuizModels>(firstPageKey: 1);

  // * List
  List<int?> _answerChoiceList = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    // * Request Career Quiz List
    context.read<CareerQuizBloc>().add(RequestCareerQuizListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocListener<CareerQuizBloc, CareerQuizState>(
        listener: (context, state) {
          // * Request Career Quiz List Success
          if (state is RequestCareerQuizListSuccessState) {
            // * Initialize answer list with nulls based on the number of questions
            _answerChoiceList = List<int?>.filled(state.response.body!.data.length, null);
            // * Set Career Quiz List
            _pagingController.itemList = state.response.body!.data;
            // * Return
            return;
          }
          // ! Request Career Quiz List Error
          if (state is RequestCareerQuizListErrorState) {
            // * Clear And Restart Session
            clearAndRestart(showSessionExpiredDialog: true);
            // * Return
            return;
          }
        },
        child: SingleChildScrollView(
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
                // * All Answer Must Be Answered
                Container(
                  margin: const EdgeInsets.only(top: Dimen.extraLargeSpace * 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${tr(LocaleKeys.all_questions_must_be_answered)} *',
                    style: CustomTextStyle.captionTextStyle(color: Colors.red),
                  ),
                ),
                // * Question List
                Container(
                  margin: const EdgeInsets.only(top: Dimen.largeSpace),
                  child: PagedListView.separated(
                    pagingController: _pagingController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
                    builderDelegate: PagedChildBuilderDelegate<CareerQuizModels>(
                      itemBuilder: (context, models, index) {
                        return ItemCareerQuizQuestion(
                          models: models,
                          questionIndex: index + 1,
                          chosenAnswer: _answerChoiceList[index],
                          answerChoices: [1, 2, 3, 4, 5], // Assuming 5 possible answers
                          onChanged: (int? value) {
                            setState(() {
                              _answerChoiceList[index] = value;
                            });
                          },
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                      newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
                    ),
                  ),
                ),
                // * Submit Button
                Container(
                  margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(tr(LocaleKeys.submit)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
