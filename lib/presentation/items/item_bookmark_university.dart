import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class ItemBookmarkUniversity extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final Function() onTap;
  const ItemBookmarkUniversity({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
      ),
      elevation: 8,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        ),
        visualDensity: const VisualDensity(
          horizontal: 3,
          vertical: 4,
        ),
        contentPadding: const EdgeInsets.only(
          left: Dimen.defaultSpace,
          right: Dimen.smallSpace,
          top: Dimen.defaultSpace,
          bottom: Dimen.defaultSpace,
        ),
        onTap: onTap,
        leading: CustomCachedNetworkImage(
          imageUrl: imageUrl,
          config: CustomCachedNetworkImageConfig(
            width: 66,
            height: 66,
            borderRadius: BorderRadius.circular(33),
            boxFit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: CustomTextStyle.titleTextStyle(
            bold: true,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(width: Dimen.smallSpace),
            Text(
              location,
              style: CustomTextStyle.bodyTextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: primaryColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
