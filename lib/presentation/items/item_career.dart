import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCareer extends StatefulWidget {
  final CareerModels models;
  final Function() onTap;
  const ItemCareer({
    super.key,
    required this.onTap,
    required this.models,
  });

  @override
  State<ItemCareer> createState() => _ItemCareerState();
}

class _ItemCareerState extends State<ItemCareer> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        child: Container(
          height: 295,
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
                height: 119,
                child: CustomCachedNetworkImage(
                  imageUrl: widget.models.image,
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
                  left: Dimen.largeSpace,
                  right: Dimen.largeSpace,
                  bottom: Dimen.extraLargeSpace,
                ),
                child: Column(
                  children: [
                    // * Job  Title
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.models.name,
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    // * Job Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.smallSpace),
                      child: Text(
                        widget.models.jobDo,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.bodyTextStyle(color: Colors.black),
                      ),
                    ),
                    // * Divider
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                    // * Salary and Availability
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                // * Salary Amount
                                TextSpan(
                                  text: '\$',
                                  style: CustomTextStyle.bodyTextStyle(color: Colors.black, bold: true),
                                  children: [
                                    TextSpan(
                                      text: widget.models.yearlyIncome.toString(),
                                      style: CustomTextStyle.bodyTextStyle(color: Colors.black, bold: true),
                                      children: [
                                        TextSpan(
                                          style: CustomTextStyle.bodyTextStyle(
                                            color: Colors.black.withOpacity(0.7),
                                          ),
                                          text: '\tmedian salary',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBookmarked = !isBookmarked;
                                  });
                                },
                                child: SvgPicture.asset(Assets.iconBookmark,
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(
                                      isBookmarked ? primaryColor : Colors.black,
                                      BlendMode.srcIn,
                                    )),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(top: Dimen.smallSpace),
                            child: Text.rich(
                              // * Availability
                              TextSpan(
                                text: '',
                                style: CustomTextStyle.captionTextStyle(color: Colors.black, bold: true),
                                children: [
                                  TextSpan(
                                    text: '${widget.models.jobGrowthRate}%',
                                    style: CustomTextStyle.bodyTextStyle(color: Colors.black, bold: true),
                                  ),
                                  TextSpan(
                                    style: CustomTextStyle.bodyTextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    text: '\tJob Growth',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
