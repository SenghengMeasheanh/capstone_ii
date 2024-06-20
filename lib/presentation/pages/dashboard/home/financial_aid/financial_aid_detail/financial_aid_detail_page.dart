import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class FinancialAidDetailPage extends StatefulWidget {
  const FinancialAidDetailPage({super.key});

  @override
  State<FinancialAidDetailPage> createState() => _FinancialAidDetailPageState();
}

class _FinancialAidDetailPageState extends State<FinancialAidDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimen.mediumSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to pay for a college: a complete guide for parents',
              style: CustomTextStyle.titleTextStyle(
                  bold: true, fontSize: Dimen.midTitleTextSize),
            ),
            const SizedBox(height: Dimen.largeSpace),
            SizedBox(
              height: 180,
              child: CustomCachedNetworkImage(
                imageUrl:
                    'https://www.alleducationschools.com/wp-content/uploads/2018/03/careers-student-teacher.jpg',
                config: CustomCachedNetworkImageConfig(
                  width: double.infinity,
                  height: double.infinity,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: Dimen.largeSpace),
            Text(
              'As a parent, the thought of college expenses can be overwhelming, but with the right understanding and approach, paying for college can be manageable and less stressful for the whole family. This guide is tailored to help you navigate the complex world of college finances and learn how new programs, like Niche Direct Admissions, are making college education more affordable. ',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.largeSpace),
            Center(
              child: Text(
                'Understanding College Costs',
                style: CustomTextStyle.titleTextStyle(
                    bold: true, color: primaryColor),
              ),
            ),
            const SizedBox(height: Dimen.largeSpace),
            Text(
              'The key to tackling college expenses is knowing what you’re up against. Tuition and fees are  just the beginning. Room and board, books, supplies and miscellaneous expenses can quickly add up. When planning for college, it’s important to build a comprehensive budget that factors in all of the following potential costs.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Tuition and fees',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Most parents are familiar with these two. Tuition is the cost of courses, usually based on credits, while fees can include things like technology and activity fees. It’s wise to expect them to rise every year.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Room for board',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Most parents are familiar with these two. Tuition is the cost of courses, usually based on credits, while fees can include things like technology and activity fees. It’s wise to expect them to rise every year.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Books and supplies',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Most parents are familiar with these two. Tuition is the cost of courses, usually based on credits, while fees can include things like technology and activity fees. It’s wise to expect them to rise every year.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Miscellaneous expenses',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            Text(
              'Most parents are familiar with these two. Tuition is the cost of courses, usually based on credits, while fees can include things like technology and activity fees. It’s wise to expect them to rise every year.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.largeSpace),
            Text('AUTHOR: Writer Name',
                style: CustomTextStyle.titleTextStyle(bold: true)),
            const SizedBox(height: Dimen.smallSpace),
            Text(
              'PathFinder helps you discover the schools and neighborhoods that are right for you.',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            const SizedBox(height: Dimen.smallSpace),
            Text('www.heloooBTS.com',
                style: CustomTextStyle.bodyTextStyle(color: Colors.blue)),
            const SizedBox(height: Dimen.smallSpace),
            Container(
              margin: const EdgeInsets.only(top: Dimen.defaultSpace),
              child: const Divider(
                color: captionTextColor,
              ),
            ),
            Row(children: [
              Text(
                'POSTED ON: ',
                style: CustomTextStyle.bodyTextStyle(bold: true),
              ),
              Text(
                'October 4,2024 11:00 AM',
                style: CustomTextStyle.bodyTextStyle(color: Colors.grey),
              ),
            ]),
            const SizedBox(height: Dimen.largeSpace),
            Text(
              'More Articles By PathFinder',
              style: CustomTextStyle.bodyTextStyle(),
            ),
            //More articles sample
            Card(
              margin: EdgeInsets.all(Dimen.smallSpace),
              child: Padding(
                padding: EdgeInsets.all(Dimen.mediumSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 90,
                      child: CustomCachedNetworkImage(
                        imageUrl:
                            'https://res.cloudinary.com/highereducation/images/f_auto,q_auto/v1659634197/BestColleges.com/BC_What-Is-Student-Teaching_247733fd61/BC_What-Is-Student-Teaching_247733fd61.jpg',
                        config: CustomCachedNetworkImageConfig(
                          width: double.infinity,
                          height: double.infinity,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimen.mediumSpace),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Everything students need to know...',
                              style: CustomTextStyle.bodyTextStyle(
                                  bold: true, color: Colors.blue)),
                          const SizedBox(width: Dimen.smallSpace),
                          Text(
                            'Des sskjfns afnsis tsheb aojdhh dnkhei sjhfioieba jhs sjab',
                            style:
                                CustomTextStyle.bodyTextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Dimen.smallSpace),
            Card(
              margin: EdgeInsets.all(Dimen.smallSpace),
              child: Padding(
                padding: EdgeInsets.all(Dimen.mediumSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: CustomCachedNetworkImage(
                        imageUrl:
                            'https://res.cloudinary.com/highereducation/images/f_auto,q_auto/v1659634197/BestColleges.com/BC_What-Is-Student-Teaching_247733fd61/BC_What-Is-Student-Teaching_247733fd61.jpg',
                        config: CustomCachedNetworkImageConfig(
                          width: double.infinity,
                          height: double.infinity,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimen.mediumSpace),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Everything students need to know...',
                              style: CustomTextStyle.bodyTextStyle(
                                  bold: true, color: Colors.blue)),
                          const SizedBox(width: Dimen.smallSpace),
                          Text(
                            'Des sskjfns afnsis tsheb aojdhh dnkhei sjhfioieba jhs sjab',
                            style:
                                CustomTextStyle.bodyTextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
