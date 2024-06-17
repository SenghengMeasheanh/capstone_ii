import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemScholarship extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String openDate;
  final String closeDate;
  final Function() onTap;

  const ItemScholarship({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.openDate,
    required this.closeDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimen.defaultRadius)),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            CustomCachedNetworkImage(
              imageUrl: imageUrl,
              config: CustomCachedNetworkImageConfig(
                height: 200,
                width: double.infinity,
                boxFit: BoxFit.cover,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimen.defaultRadius)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Scholarship Title
                  Text(name, style: CustomTextStyle.titleTextStyle(bold: true)),
                  const SizedBox(height: Dimen.smallSpace),
                  // * Scholarship Description
                  Text(
                    description,
                    style: CustomTextStyle.bodyTextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                  // * Scholarship Deadline
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: Dimen.smallSpace),
                              Text(
                                'Open: $openDate',
                                style: CustomTextStyle.captionTextStyle(),
                              ),
                            ],
                          ),
                          const SizedBox(height: Dimen.smallSpace),
                          Row(
                            children: [
                              const SizedBox(width: Dimen.smallSpace),
                              Text(
                                'Close: $closeDate',
                                style: CustomTextStyle.captionTextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: onTap, // Navigate to the detailed page
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimen.mediumSpace,
                            vertical: Dimen.mediumSpace,
                          ),
                          child: Text(
                            'See more...',
                            style: CustomTextStyle.bodyTextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
