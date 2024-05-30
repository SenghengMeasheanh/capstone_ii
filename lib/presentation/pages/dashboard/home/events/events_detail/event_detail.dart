import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class EventDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String location;
  final String description;

  const EventDetailPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              // * Event Title
              Text(
                title,
                style: CustomTextStyle.largeTitleTextStyle(bold: true),
              ),
              Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: Dimen.largeSpace),
              const SizedBox(height: Dimen.mediumSpace),
              // * Event Date and Time
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                  const SizedBox(width: Dimen.smallSpace),
                  Text(date, style: CustomTextStyle.bodyTextStyle()),
                  const SizedBox(width: Dimen.mediumSpace),
                  Icon(Icons.access_time, size: 20, color: Colors.grey),
                  const SizedBox(width: Dimen.smallSpace),
                  Text(time, style: CustomTextStyle.bodyTextStyle()),
                ],
              ),
              const SizedBox(height: Dimen.mediumSpace),
              // * Event Location
              Row(
                children: [
                  Icon(Icons.location_on, size: 20, color: Colors.grey),
                  const SizedBox(width: Dimen.smallSpace),
                  Expanded(
                    child: Text(location, style: CustomTextStyle.bodyTextStyle()),
                  ),
                ],
              ),
              const SizedBox(height: Dimen.largeSpace),
              // * Event Description
              Text('Description', style: CustomTextStyle.titleTextStyle(bold: true)),
              const SizedBox(height: Dimen.mediumSpace),
              Text(description, style: CustomTextStyle.bodyTextStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
