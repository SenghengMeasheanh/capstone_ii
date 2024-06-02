import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class ItemFilter extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ItemFilter({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: CustomTextStyle.titleTextStyle(bold: true),
      ),
      onTap: onTap,
    );
  }
}
