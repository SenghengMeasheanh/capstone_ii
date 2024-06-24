import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/helper/styles/dimen.dart';
import 'package:capstone_ii/presentation/items/item_guide.dart';
import 'package:capstone_ii/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';


class GuidesPage extends StatefulWidget {
  const GuidesPage({super.key});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  final _searchBarController = TextEditingController();
  final List<Map<String, dynamic>> guides = [
    {
      'title': 'Your Guide to Choosing the Right University in Cambodia',
      'imageAsset': 'assets/images/guide.jpg',
      'description':
          'As a high school student in Cambodia, the decision of which university to attend can be both exciting and daunting.'
    },
    {
      'title': 'Guide to Scholarship Opportunities in Cambodia',
      'imageAsset': 'assets/images/guide5.jpg',
      'description':
          'Navigating the world of scholarships can be a challenge, but we are here to help you find the right opportunities.'
    },
    {
      'title': 'Your Guide to Choosing the Right University in Cambodia',
      'imageAsset': 'assets/images/guide6.jpg',
      'description':
          'As a high school student in Cambodia, the decision of which university to attend can be both exciting and daunting.'
    },
  ];

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
              // * Title
              Container(
                margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                child: Text(
                  'College Guidance',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // * Searchbar
              SearchBarWidget(
                  controller: _searchBarController, onChange: (value) => {}),
              // * Card to display Guide blog
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: guides.length,
                itemBuilder: (context, index) {
                  return ItemGuide(
                    index: index,
                    guides: guides,
                    captionTextStyle: CustomTextStyle.bodyTextStyle(),
                    captionTextColor: Colors.black, // Specify the correct color
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
