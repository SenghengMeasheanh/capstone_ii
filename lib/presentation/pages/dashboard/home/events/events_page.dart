import 'package:capstone_ii/presentation/items/item_events.dart';
import 'package:capstone_ii/presentation/pages/dashboard/home/events/events_detail/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:capstone_ii/helper/utils/navigator_utils.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // Controller
  final _searchBarController = TextEditingController();

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
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
              // Title
              Container(
                margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                child: Text(
                  'Events',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // Searchbar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) => {},
              ),
              // Filter Menu
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
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: Dimen.largeSpace,
                        vertical: Dimen.smallSpace,
                      ),
                    ),
                    ChoiceChip(
                      label: Text(
                        'Workshops',
                        style: CustomTextStyle.captionTextStyle(
                          color: primaryColor,
                          bold: true,
                        ),
                      ),
                      disabledColor: Colors.white,
                      side: const BorderSide(color: primaryColor),
                      selected: false,
                    ),
                    ChoiceChip(
                      label: Text(
                        'Meetups',
                        style: CustomTextStyle.captionTextStyle(
                          color: primaryColor,
                          bold: true,
                        ),
                      ),
                      disabledColor: Colors.white,
                      side: const BorderSide(color: primaryColor),
                      selected: false,
                    ),
                  ],
                ),
              ),
              // Event List
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: Dimen.mediumSpace),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ItemEvent(
                      imageUrl: 'assets/images/event1.png',
                      title: 'Event Title $index',
                      date: 'June 30, 2023',
                      time: '10:00 AM - 2:00 PM',
                      location: 'Innovation center, CADT',
                      onTap: () {
                        context.push(
                          destination: EventDetailPage(
                            imageUrl: 'https://www.cadt.edu.kh/wp-content/uploads/2022/06/CADT-AND-PPCBank-TO-SIGNED-A-CORPORATION-ON-DIGITAL-EDUCATION-AND-INTERNSHIP-PROGRAM-6-1.jpg',
                            title: 'Event Title $index',
                            date: 'June 30, 2023',
                            time: '10:00 AM - 2:00 PM',
                            location: 'Event Location $index',
                            description:
                                'Education is one of the most important investments in our future that we can undertake. Lifelong learning, new technologies, Artificial Intelligence – these buzzwords are all around and affect the world of education just as much as the world of work and our everyday lives. With the rapid advancement of digitalization in all areas, education can and should not fall behind when it comes to utilizing these tools for the advancement in classrooms, the workplace, and all areas of life. On the contrary, for young people to be able to make use of all the possibilities that digitalization brings, they need to be exposed to them at an early stage. This does not only involve access to equipment and facilities, which can be a challenge itself, but also refers to the understanding of how to use these tools responsibly, understanding their benefits, chances, and limits.',
                          ),
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
