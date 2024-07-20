import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemEvent extends StatelessWidget {
  final dynamic models;
  final Function() onTap;
  const ItemEvent({
    super.key,
    required this.models,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            // * Event Thumbnail Image
            CustomCachedNetworkImage(
              imageUrl: models.thumbnailImage,
              config: CustomCachedNetworkImageConfig(
                height: 150,
                width: double.infinity,
                boxFit: BoxFit.cover,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Dimen.defaultRadius),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimen.mediumSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Event Title
                  Text(
                    models.name,
                    style: CustomTextStyle.titleTextStyle(bold: true),
                  ),
                  // * Event Date and Time
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: Text(
                      '${models.eventDate} - ${models.startAt} to ${models.endAt}',
                      style: CustomTextStyle.bodyTextStyle(),
                    ),
                  ),
                  // * Event Location
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconLocation,
                          height: Dimen.captionTextSize,
                          width: Dimen.captionTextSize,
                          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                        const SizedBox(width: Dimen.smallSpace),
                        Text(
                          models.location,
                          style: CustomTextStyle.bodyTextStyle(),
                        ),
                      ],
                    ),
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
