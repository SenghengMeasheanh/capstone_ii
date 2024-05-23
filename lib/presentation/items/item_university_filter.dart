import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class ItemUniversityFilter extends StatelessWidget {
  final String title;
  const ItemUniversityFilter({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          title,
          style: CustomTextStyle.captionTextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
