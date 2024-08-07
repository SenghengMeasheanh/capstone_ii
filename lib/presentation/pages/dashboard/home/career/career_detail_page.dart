import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareerDetailPage extends StatefulWidget {
  final int id;
  const CareerDetailPage({super.key, required this.id});

  @override
  State<CareerDetailPage> createState() => _CareerDetailPageState();
}

class _CareerDetailPageState extends State<CareerDetailPage> {
  // * Models
  CareerDetailModels? _careerDetailModels;

  @override
  void initState() {
    super.initState();
    // * Request Career Detail
    context.read<CareerBloc>().add(RequestCareerDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<CareerBloc, CareerState>(
        listener: (context, state) {
          // * Request Career Detail Success State
          if (state is RequestCareerDetailSuccessState) {
            // * Set Career Detail Models
            _careerDetailModels = state.response.body.data;
            // * Notify UI
            setState(() {});
            // * Return
            return;
          }
          // ! Request Career Detail Error State
          if (state is RequestCareerDetailErrorState) {
            // * Return
            return;
          }
        },
        child: _careerDetailModels != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 141.h,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: Dimen.largeSpace,
                              right: Dimen.largeSpace,
                              top: Dimen.defaultSpace,
                              bottom: Dimen.largeSpace * 2 + 4,
                            ),
                            width: double.infinity,
                            color: primaryColor.withOpacity(0.3),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Career Title
                                Text(
                                  _careerDetailModels!.name,
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Career Type
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    _careerDetailModels!.careerTypes.map((e) => e.name).join(', '),
                                    style: CustomTextStyle.captionTextStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 22,
                            top: 77,
                            child: CustomCachedNetworkImage(
                              imageUrl: _careerDetailModels!.image,
                              config: CustomCachedNetworkImageConfig(
                                width: 81,
                                height: 64,
                                borderRadius: BorderRadius.circular(5),
                                boxFit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.contentPadding,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                        bottom: Dimen.extraLargeSpace + 10,
                      ),
                      child: Column(
                        children: [
                          // * Brief Detail
                          Column(
                            children: [
                              // * Yearly Income
                              CustomBriefWidget(
                                title: tr(LocaleKeys.median_yearly_income),
                                subtitle: '${_careerDetailModels!.yearlyIncome} \$',
                                icon: Assets.iconMoney,
                                isSubtitleBold: true,
                              ),
                              // * Education Level
                              CustomBriefWidget(
                                title: tr(LocaleKeys.most_common_education_level),
                                subtitle: _careerDetailModels!.commonDegreeLevel.name,
                                icon: Assets.iconEducationLevel,
                                isSubtitleBold: true,
                              ),
                              // * Job Growth
                              CustomBriefWidget(
                                title: tr(LocaleKeys.projected_job_growth),
                                subtitle: '${_careerDetailModels!.jobGrowthRate}%',
                                icon: Assets.iconJobGrowth,
                                isSubtitleBold: true,
                              ),
                            ],
                          ),
                          // * Divider
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          // * What Does Career Do
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.largeSpace),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.what_do_career_do,
                                      namedArgs: {'career': _careerDetailModels!.name}),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    _careerDetailModels!.jobDo,
                                    style: CustomTextStyle.bodyTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // * Career Earninngs
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.how_much_do_career_earn_yearly,
                                      namedArgs: {'career': _careerDetailModels!.name}),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: _careerDetailModels!.earning == null
                                      ? Text(
                                          tr(LocaleKeys.this_information_is_not_currently_provided),
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        )
                                      : CustomHtmlWidget(
                                          data: _careerDetailModels!.earning!,
                                        ),
                                ),
                              ],
                            ),
                          ),
                          // * Job Outlook
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(
                                    LocaleKeys.what_is_the_job_outlook_for_new_career,
                                    namedArgs: {'career': _careerDetailModels!.name},
                                  ),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: _careerDetailModels!.jobOutlook == null
                                      ? Text(
                                          tr(LocaleKeys.this_information_is_not_currently_provided),
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        )
                                      : CustomHtmlWidget(
                                          data: _careerDetailModels!.jobOutlook!,
                                        ),
                                ),
                              ],
                            ),
                          ),
                          // * Project Growth Rate
                          Container(
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                            padding: const EdgeInsets.symmetric(horizontal: Dimen.mediumSpace),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.3),
                            ),
                            child: Text(
                              '${tr(LocaleKeys.project_growth_rate)}: ${_careerDetailModels!.jobGrowthRate}%',
                              style: CustomTextStyle.bodyTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // * Job Education Level
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.what_education_level_do_career_have,
                                      namedArgs: {'career': _careerDetailModels!.name}),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    tr(LocaleKeys.career_detail_table_description),
                                    style: CustomTextStyle.bodyTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                // * Education Level Header Table
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr(LocaleKeys.education_level),
                                        style: CustomTextStyle.bodyTextStyle(),
                                      ),
                                      Text(
                                        tr(LocaleKeys.percentage),
                                        style: CustomTextStyle.bodyTextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                                // * Divider
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: const Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                // * Education Level Body Table
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Column(
                                    children: _careerDetailModels!.careerEducationLevels
                                        .map(
                                          (e) => _EducationLevelRow(
                                            educationLevel: e.degreeLevel.name,
                                            percentage: e.percentage.toString(),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // * Tasks
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.tasks),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    tr(LocaleKeys.what_tasks_do_career_perform,
                                        namedArgs: {'career': _careerDetailModels!.name}),
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                _careerDetailModels!.task == null
                                    ? Container(
                                        margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                        child: Text(
                                          tr(LocaleKeys.this_information_is_not_currently_provided),
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                        alignment: Alignment.centerLeft,
                                        child: CustomHtmlWidget(
                                          data: _careerDetailModels!.task!,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          // *  Knowledge
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.knowledge),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    tr(LocaleKeys.what_do_career_need_to_know,
                                        namedArgs: {'career': _careerDetailModels!.name}),
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: _careerDetailModels!.knowledge == null
                                      ? Text(
                                          tr(LocaleKeys.this_information_is_not_currently_provided),
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        )
                                      : CustomHtmlWidget(
                                          data: _careerDetailModels!.knowledge!,
                                        ),
                                ),
                              ],
                            ),
                          ),
                          // * Skills
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // * Title
                                Text(
                                  tr(LocaleKeys.skills),
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    tr(LocaleKeys.what_do_career_need_to_know,
                                        namedArgs: {'career': _careerDetailModels!.name}),
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: _careerDetailModels!.skill == null
                                      ? Text(
                                          tr(LocaleKeys.this_information_is_not_currently_provided),
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        )
                                      : CustomHtmlWidget(
                                          data: _careerDetailModels!.skill!,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const ProgressBar(),
      ),
    );
  }
}

class _EducationLevelRow extends StatelessWidget {
  final String educationLevel;
  final String percentage;

  const _EducationLevelRow({
    required this.educationLevel,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              educationLevel,
              style: CustomTextStyle.bodyTextStyle(),
            ),
            Text(
              '$percentage %',
              style: CustomTextStyle.bodyTextStyle(),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: Dimen.mediumSpace, bottom: Dimen.mediumSpace),
          child: const Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
