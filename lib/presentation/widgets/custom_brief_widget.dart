import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBriefWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const CustomBriefWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: SvgPicture.asset(
        icon,
        width: 35,
        height: 35,
      ),
      title: Text(
        title,
        style: CustomTextStyle.bodyTextStyle(),
      ),
      subtitle: Text(
        subtitle,
        style: CustomTextStyle.bodyTextStyle(),
      ),
    );
  }
}
