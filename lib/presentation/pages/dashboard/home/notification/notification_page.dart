import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: Dimen.largeSpace),
              padding: const EdgeInsets.only(left: Dimen.contentPadding),
              alignment: Alignment.centerLeft,
              child: Text(
                'New',
                style: CustomTextStyle.bodyTextStyle(bold: true),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                separatorBuilder: (_, __) => const SizedBox(
                  height: Dimen.mediumSpace,
                ),
                itemBuilder: (_, index) => ListTile(
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
                  title: Text('Notification Title'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You may qualify for additional financial aid from certain schools.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.largeSpace),
                        child: Text('Notification Date'),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
