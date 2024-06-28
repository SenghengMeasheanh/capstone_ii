import 'package:capstone_ii/data/data_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class ItemFinancialAid extends StatelessWidget {
  final FinancialAidModels models;
  final Function() onTap;

  const ItemFinancialAid({
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
        elevation: 5,
        shadowColor: Colors.black,
        child: Wrap(
          children: [
            // * Job Image
            SizedBox(
              height: 150,
              child: CustomCachedNetworkImage(
                imageUrl: models.image,
                config: CustomCachedNetworkImageConfig(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimen.defaultRadius),
                    topRight: Radius.circular(Dimen.defaultRadius),
                  ),
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimen.mediumSpace),
              child: Column(
                children: [
                  // * Job  Title
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      models.name,
                      style: CustomTextStyle.titleTextStyle(bold: true),
                    ),
                  ),
                  // * Job Description
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      models.shortDescription,
                      style: CustomTextStyle.captionTextStyle(color: Colors.black),
                      textAlign: TextAlign.justify,
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
