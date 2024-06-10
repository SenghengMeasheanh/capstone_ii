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
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
  });

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
              // * Event Image
              Image.network(imageUrl,
                  height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: Dimen.largeSpace),
              const SizedBox(height: Dimen.mediumSpace),
              // * Event Date, Time and location
              Row(
                children: [
                  //Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                  const SizedBox(width: Dimen.smallSpace),
                  Text(date,
                      style: CustomTextStyle
                          .captionTextStyle()), // Icon(Icons.access_time, size: 20, color: Colors.grey),
                  const SizedBox(width: Dimen.smallSpace),
                  const Text('|'),
                  const SizedBox(width: Dimen.smallSpace),
                  Text(time, style: CustomTextStyle.captionTextStyle()),
                  const SizedBox(width: Dimen.smallSpace),
                  const Text('|'),
                  const SizedBox(width: Dimen.smallSpace),
                  Text(location, style: CustomTextStyle.captionTextStyle()),
                ],
              ),
              const SizedBox(height: Dimen.mediumSpace),
              const SizedBox(height: Dimen.largeSpace),
              // * Event Description
              Text('Description',
                  style: CustomTextStyle.titleTextStyle(bold: true)),
              const SizedBox(height: Dimen.mediumSpace),
              Text(description, style: CustomTextStyle.bodyTextStyle()),
              // * Apply Button

              const SizedBox(height: Dimen.largeSpace),
              //Button apply now
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    backgroundColor: primaryColor, // Background color
                  ),
                  child: Text(
                    'Resgister now',
                    style: CustomTextStyle.buttonTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
