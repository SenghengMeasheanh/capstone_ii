import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class ItemUniversityProgram extends StatelessWidget {
  final String imageUrl;
  final String title;
  const ItemUniversityProgram({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: double.infinity,
      height: 166,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          CustomCachedNetworkImage(
            imageUrl: imageUrl,
            config: CustomCachedNetworkImageConfig(
              width: double.infinity,
              height: 125,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              boxFit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(title, style: CustomTextStyle.bodyTextStyle(bold: true)),
          ),
        ],
      ),
    );
  }
}
