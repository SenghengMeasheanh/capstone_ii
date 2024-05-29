import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCareer extends StatefulWidget {
  const ItemCareer({super.key});

  @override
  State<ItemCareer> createState() => _ItemCareerState();
}

class _ItemCareerState extends State<ItemCareer> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 295,
        width: 318,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Wrap(
          children: [
            // * Job Image
            SizedBox(
              height: 119,
              child: CustomCachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQe9O2ygl2WDHxE9_Q7rhALYVhVTi-qkJ9JA&s',
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
                      'Cybersecurity Analyst',
                      style: CustomTextStyle.titleTextStyle(bold: true),
                    ),
                  ),
                  // * Job Description
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: Text(
                      'Cybersecurity analysts are responsible for protecting an organization’s computer systems and networks.',
                      style: CustomTextStyle.captionTextStyle(color: Colors.black),
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              // * Salary Amount
                              TextSpan(
                                text: '\$',
                                style: CustomTextStyle.captionTextStyle(color: Colors.black, bold: true),
                                children: [
                                  TextSpan(
                                    text: '50,000',
                                    style: CustomTextStyle.captionTextStyle(color: Colors.black, bold: true),
                                    children: [
                                      TextSpan(
                                        style: CustomTextStyle.captionTextStyle(
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
                          margin: const EdgeInsets.only(top: Dimen.smallSpace, bottom: Dimen.mediumSpace),
                          child: Text.rich(
                            // * Availability
                            TextSpan(
                              text: '\$',
                              style: CustomTextStyle.captionTextStyle(color: Colors.black, bold: true),
                              children: [
                                TextSpan(
                                  text: '82,489',
                                  style: CustomTextStyle.captionTextStyle(color: Colors.black, bold: true),
                                  children: [
                                    TextSpan(
                                      style: CustomTextStyle.captionTextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                      text: '\tjobs available',
                                    ),
                                  ],
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
    );
  }
}
