import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemScholarship extends StatelessWidget {
  final dynamic models;
  final Function() onTap;

  const ItemScholarship({
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
                  Text(models.name, style: CustomTextStyle.titleTextStyle(bold: true)),
                  const SizedBox(height: Dimen.smallSpace),
                  // * Scholarship Description
                  Text(
                    models.description,
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
                            '${tr(LocaleKeys.open_date)}: ${DateFormat('d MMMM y').format(DateTime.parse(models.openDate))}',
                            style: CustomTextStyle.bodyTextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimen.smallSpace),
                      Row(
                        children: [
                          const SizedBox(width: Dimen.smallSpace),
                          Text(
                            '${tr(LocaleKeys.close_date)}: ${DateFormat('d MMMM y').format(DateTime.parse(models.closeDate))}',
                            style: CustomTextStyle.bodyTextStyle(),
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
