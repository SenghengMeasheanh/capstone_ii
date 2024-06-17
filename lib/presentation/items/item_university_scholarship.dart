import 'package:capstone_ii/data/data_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemUniversityScholarship extends StatelessWidget {
  final UniversityScholarshipModels models;
  final Function() onTap;

  const ItemUniversityScholarship({
    super.key,
    required this.models,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        ),
        elevation: 2,
        shadowColor: Colors.grey,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            CustomCachedNetworkImage(
              imageUrl: models.image,
              config: CustomCachedNetworkImageConfig(
                height: 125,
                width: double.infinity,
                boxFit: BoxFit.cover,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimen.defaultRadius)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimen.extraLargeSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Scholarship Title
                  Text(models.nameEn, style: CustomTextStyle.titleTextStyle(bold: true)),
                  const SizedBox(height: Dimen.smallSpace),
                  // * Scholarship Description
                  Text(
                    models.descriptionEn,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: Dimen.smallSpace),
                          Text(
                            'Open Date: ${DateFormat('d MMMM y').format(DateTime.parse(models.openDate))}',
                            style: CustomTextStyle.captionTextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimen.smallSpace),
                      Row(
                        children: [
                          const SizedBox(width: Dimen.smallSpace),
                          Text(
                            'Close Date: ${DateFormat('d MMMM y').format(DateTime.parse(models.closeDate))}',
                            style: CustomTextStyle.captionTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
