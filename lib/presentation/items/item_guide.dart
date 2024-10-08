import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/styles/dimen.dart';

class ItemGuide extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> guides;
  final TextStyle captionTextStyle;
  final Color captionTextColor;

  const ItemGuide({
    super.key,
    required this.index,
    required this.guides,
    required this.captionTextStyle,
    required this.captionTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.only(top: Dimen.mediumSpace),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(guides[index]['imageAsset']),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guides[index]['title'],
                    style: TextStyle(
                      fontSize: Dimen.midTitleTextSize,
                      color: captionTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: Dimen.defaultSpace,
                  ),
                  Text(
                    guides[index]['description'],
                    style: TextStyle(
                      fontSize: 15,
                      color: captionTextColor,
                    ),
                  ),
                  Container(
                    height: Dimen.defaultSpace,
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
