import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: primaryColor.withOpacity(0.2),
      leading: ActionMenuIcon(
        radius: 24,
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {},
        backgroundColor: primaryColor,
      ),
      visualDensity: const VisualDensity(
        horizontal: -2,
        vertical: 4,
      ),
      minTileHeight: 6,
      minLeadingWidth: 2,
      contentPadding: const EdgeInsets.only(
        left: Dimen.mediumSpace,
        right: Dimen.mediumSpace,
        top: Dimen.mediumSpace,
      ),
      title: const Text('Notification Title'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You may qualify for additional financial aid from certain schools.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: const EdgeInsets.only(top: Dimen.largeSpace),
            child: const Text('Notification Date'),
          ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
