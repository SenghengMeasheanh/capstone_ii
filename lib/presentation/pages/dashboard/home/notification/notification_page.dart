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
                itemBuilder: (_, index) => const ItemNotification(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
