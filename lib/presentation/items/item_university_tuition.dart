import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class ItemUniversityTuition extends StatelessWidget {
  final UniversityTuitionModels models;
  const ItemUniversityTuition({
    super.key,
    required this.models,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                models.nameEn,
                style: CustomTextStyle.bodyTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                '${double.parse(models.tuition).toInt()}\$ per year',
                style: CustomTextStyle.bodyTextStyle(),
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
