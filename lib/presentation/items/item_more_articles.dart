import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class ItemMoreArticles extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Function() onTap;
  const ItemMoreArticles(
      {super.key, required this.title, required this.subtitle, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: false,
          visualDensity: VisualDensity.comfortable,
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: CustomCachedNetworkImage(
            imageUrl: imageUrl,
            config: CustomCachedNetworkImageConfig(
              padding: EdgeInsets.zero,
              width: 100,
              height: 80,
              boxFit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: CustomTextStyle.titleTextStyle(
              bold: true,
              color: Colors.blue,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: CustomTextStyle.bodyTextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.7),
        ),
      ],
    );
  }
}
