import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ItemSlideShow extends StatelessWidget {
  final String imageUrl;
  final Function() onTap;

  const ItemSlideShow({
    super.key,
    required this.imageUrl, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCachedNetworkImage(
        onTap: onTap,
        imageUrl: imageUrl,
        config: CustomCachedNetworkImageConfig(
          boxFit: BoxFit.cover,
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        ),
      ),
    );
  }
}
