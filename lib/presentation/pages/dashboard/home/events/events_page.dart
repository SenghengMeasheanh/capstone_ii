import 'package:capstone_ii/presentation/items/item_events.dart';
import 'package:capstone_ii/presentation/pages/dashboard/home/events/events_detail/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final _searchBarController = TextEditingController();

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  void _navigateToEventDetail(BuildContext context, String imageUrl, String title, String date, String time, String location, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailPage(
          imageUrl: imageUrl,
          title: title,
          date: date,
          time: time,
          location: location,
          description: description,
        ),
      ),
    );
  }

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
          padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Title
              Container(
                margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                child: Text(
                  'Events',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // * Searchbar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) => {},
              ),
              // * Filter Menu
              Container(
                margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                child: Wrap(
                  spacing: 10,
                  children: [
                    const ChoiceChip(
                      labelStyle: TextStyle(color: Colors.white),
                      label: Text('All Events'),
                      selected: true,
                      selectedColor: primaryColor,
                      labelPadding: EdgeInsets.symmetric(horizontal: Dimen.largeSpace, vertical: Dimen.smallSpace),
                    ),
                    ChoiceChip(
                      label: Text(
                        'Workshops',
                        style: CustomTextStyle.captionTextStyle(color: primaryColor, bold: true),
                      ),
                      disabledColor: Colors.white,
                      side: const BorderSide(color: primaryColor),
                      selected: false,
                    ),
                    const ChoiceChip(
                      label: Text('Meetups'),
                      selected: false,
                    ),
                 
                  ],
                ),
              ),
              // * Event List
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ItemEvent(
                      imageUrl: 'assets/images/event1.png',
                      title: 'Event Title $index',
                      date: 'June 30, 2023',
                      time: '10:00 AM - 2:00 PM',
                      location: 'Inovation center, CADT',
                      onTap: () {
                        _navigateToEventDetail(
                          context,
                          'assets/images/event1.png',
                          'Event Title $index',
                          'June 30, 2023',
                          '10:00 AM - 2:00 PM',
                          'Event Location $index',
                          'This is a detailed description of the event $index.',
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
