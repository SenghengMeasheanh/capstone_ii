import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class ItemBookmarkCareer extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final Function() onTap;
  const ItemBookmarkCareer({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CustomCachedNetworkImage(
        imageUrl: imageUrl,
        config: CustomCachedNetworkImageConfig(
          width: 66,
          height: 66,
          borderRadius: BorderRadius.circular(33),
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
    );
  }
}
