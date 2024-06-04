import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class ItemEvent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String location;
  final VoidCallback onTap;

  const ItemEvent({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: CustomTextStyle.titleTextStyle(bold: true)),
                  const SizedBox(height: Dimen.smallSpace),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                      const SizedBox(width: Dimen.smallSpace),
                      Text(date, style: CustomTextStyle.bodyTextStyle()),
                    ],
                  ),
                  const SizedBox(height: Dimen.smallSpace),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20, color: Colors.grey),
                      const SizedBox(width: Dimen.smallSpace),
                      Text(time, style: CustomTextStyle.bodyTextStyle()),
                    ],
                  ),
                  const SizedBox(height: Dimen.smallSpace),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.grey),
                      const SizedBox(width: Dimen.smallSpace),
                      Text(location, style: CustomTextStyle.bodyTextStyle()),
                      
                    ],
                    
                  ),
                ],
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
