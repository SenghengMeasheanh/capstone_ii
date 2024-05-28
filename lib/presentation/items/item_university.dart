import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemUniversity extends StatelessWidget {
  final String imageUrl;
  final Function() onTap;
  const ItemUniversity({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            SizedBox(
              height: 232,
              child: CustomCachedNetworkImage(
                imageUrl: imageUrl,
                config: CustomCachedNetworkImageConfig(
                  width: double.infinity,
                  height: 100,
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              bottom: 160,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Dimen.defaultRadius),
                  ),
                  border: Border.all(color: Colors.black),
                ),
                child: CustomCachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeWHerau4p1KatwBXrCHlRSVCID1NZWxb_Q_ABKPZNWg&s',
                  config: CustomCachedNetworkImageConfig(
                    width: 60,
                    height: 60,
                    boxFit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                  ),
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
                  borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * University Name and Favorite Icon
                    ListTile(
                      title: Text(
                        'CADT - Cambodia Academy of Digital Technology ',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                      trailing: const Icon(Icons.favorite_border),
                    ),
                    // * University Briefs
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimen.defaultSpace),
                      child: Column(
                        children: [
                          // * University Year of Study and Type
                          ItemUniversityBrief(
                            icon: Icon(Icons.school),
                            value: '4 years Private',
                          ),
                          // * University Fees
                          ItemUniversityBrief(
                            icon: Icon(Icons.attach_money),
                            value: '\$2K Average Per Year After Aid',
                          ),
                          // * University Graduation Rate
                          ItemUniversityBrief(
                            icon: Icon(Icons.school_outlined),
                            value: 'Graduation Rate 90%',
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
