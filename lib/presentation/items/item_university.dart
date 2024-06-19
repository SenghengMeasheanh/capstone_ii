import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemUniversity extends StatelessWidget {
  final UniversityModels models;
  final Function() onTap;
  const ItemUniversity({super.key, required this.models, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.defaultRadius)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // * Cover Image
            SizedBox(
              height: 232,
              child: models.image != null
                  ? CustomCachedNetworkImage(
                      imageUrl: models.image!,
                      config: CustomCachedNetworkImageConfig(
                        width: double.infinity,
                        height: 100,
                        boxFit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                      ),
                    )
                  : Image.asset(
                      Assets.imageNoImage,
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            // * Logo Image
            Positioned(
              right: 20,
              bottom: 150,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
                  border: Border.all(color: Colors.black),
                ),
                child: models.logoImage != null
                    ? CustomCachedNetworkImage(
                        imageUrl: models.logoImage!,
                        config: CustomCachedNetworkImageConfig(
                          width: 60,
                          height: 60,
                          boxFit: BoxFit.cover,
                          borderRadius: const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
                        ),
                      )
                    : Image.asset(
                        Assets.imageNoImage,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Dimen.defaultRadius)),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * University Name and Favorite Icon
                    ListTile(
                      title: Text(
                        models.name,
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                      trailing: const Icon(Icons.favorite_border),
                    ),
                    // * University Briefs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.defaultSpace),
                      child: Column(
                        children: [
                          // * University Year of Study and Type
                          ItemUniversityBrief(
                            icon: const Icon(Icons.school),
                            value: '${models.averageStudyYear} years ${models.type}',
                          ),
                          // * University Fees
                          ItemUniversityBrief(
                            icon: const Icon(Icons.attach_money),
                            value: '\$${models.averageTuition} Average Per Year After Aid',
                          ),
                          // * University Graduation Rate
                          ItemUniversityBrief(
                            icon: const Icon(Icons.school_outlined),
                            value: 'Graduation Rate ${models.graduationRate}%',
                          ),
                        ],
                      ),
                    )
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

class ItemUniversityBrief extends StatelessWidget {
  final Icon icon;
  final String value;
  const ItemUniversityBrief({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: Dimen.smallSpace),
        Text(value, style: CustomTextStyle.captionTextStyle()),
      ],
    );
  }
}
