import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                title: 'Median Yearly Income',
                                subtitle: '${_careerDetailModels!.yearlyIncome} \$',
                                icon: Assets.iconMoney,
                                isSubtitleBold: true,
                              ),
                              // * Education Level
                              CustomBriefWidget(
                                title: 'Most Common Education Level',
                                subtitle: _careerDetailModels!.commonDegreeLevel.name,
                                icon: Assets.iconEducationLevel,
                                isSubtitleBold: true,
                              ),
                              // * Job Growth
                              CustomBriefWidget(
                                title: 'Projected Job Growth',
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
                                  'What do ${_careerDetailModels!.name} do?',
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
                                  'How much do ${_careerDetailModels!.name} earn yearly?',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: CustomHtmlWidget(
                                    data: _careerDetailModels!.earning,
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
                                  'What is the job outlook for new ${_careerDetailModels!.name}?',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: CustomHtmlWidget(
                                    data: _careerDetailModels!.jobOutlook,
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
                              'Project Growth Rate: ${_careerDetailModels!.jobGrowthRate}%',
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
                                  'What education level do ${_careerDetailModels!.name} do?',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Description
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    'This table shows the percentage of responses to a survey asking what education level is needed in this career.',
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
                                        'Education Level',
                                        style: CustomTextStyle.bodyTextStyle(),
                                      ),
                                      Text(
                                        'Percentage',
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
                                  'Tasks',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    'What tasks do ${_careerDetailModels!.name} perform?',
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: CustomHtmlWidget(
                                    data: _careerDetailModels!.task,
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
                                  'Knowledge',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    'What do ${_careerDetailModels!.name} need to know?',
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: _careerDetailModels!.knowledge == null
                                      ? Text(
                                          'This information is not currently provided.',
                                          style:
                                              CustomTextStyle.bodyTextStyle(color: primaryColor.withOpacity(0.3)),
                                        )
                                      : CustomHtmlWidget(
                                          data: _careerDetailModels!.knowledge,
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
                                  'Skills',
                                  style: CustomTextStyle.titleTextStyle(bold: true),
                                ),
                                // * Descriptions
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: Text(
                                    'What skills do ${_careerDetailModels!.name} need?',
                                    style: CustomTextStyle.titleTextStyle(),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                                  child: CustomHtmlWidget(
                                    data: _careerDetailModels!.skill,
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
