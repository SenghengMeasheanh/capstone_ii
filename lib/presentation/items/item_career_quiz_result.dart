import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemCareerQuizResult extends StatelessWidget {
  final CareerQuizResultModels models;
  final int number;
  final Function() onTap;
  const ItemCareerQuizResult({
    super.key,
    required this.models,
    required this.onTap,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ListTile(
        contentPadding: const EdgeInsets.all(Dimen.mediumSpace),
        dense: true,
        onTap: onTap,
        title: Text('${number.toString()} ${models.name}'),
        trailing: Text('${tr(LocaleKeys.score)}: ${models.careerScore.toStringAsFixed(2)}'),
      ),
    );
  }
}
