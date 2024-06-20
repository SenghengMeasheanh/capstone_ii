import 'package:flutter/material.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class FinancialAidItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Function() onTap;

  const FinancialAidItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 220,
          width: 318,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimen.defaultRadius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Wrap(
            children: [
              // * Job Image
              SizedBox(
                height: 150,
                child: CustomCachedNetworkImage(
                  imageUrl:
                      'https://www.alleducationschools.com/wp-content/uploads/2018/03/careers-student-teacher.jpg',
                  config: CustomCachedNetworkImageConfig(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimen.defaultRadius),
                      topRight: Radius.circular(Dimen.defaultRadius),
                    ),
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(
                  top: Dimen.mediumSpace,
                  left: Dimen.mediumSpace,
                  right: Dimen.mediumSpace,
                  bottom: Dimen.largeSpace,
                ),
                child: Column(
                  children: [
                    // * Job  Title
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'How to pay for college',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    // * Job Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.smallSpace),
                      child: Text(
                        'we can pay by credit card, paypal, or check.and also can pay by cash in Cambodia or online. fjjshshdhhdvuasj',
                        style: CustomTextStyle.captionTextStyle(
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
