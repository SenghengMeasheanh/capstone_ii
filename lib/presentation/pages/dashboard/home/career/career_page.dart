import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/pages/dashboard/home/career/career_detail_page.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  // * Controller
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
              // * Title
              Container(
                margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                child: Text(
                  'Career',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // * Searchbar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) => {},
              ),
              // * Subitlet
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: Dimen.largeSpace),
                child: Text(
                  'Find a career that works \n for you',
                  style: CustomTextStyle.largeTitleTextStyle(fontSize: Dimen.titleTextSize + 8, bold: true),
                  textAlign: TextAlign.center,
                ),
              ),
              // * Filter Description
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                child: Text(
                  'Filter by job category',
                  style: CustomTextStyle.bodyTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              // * Filter Menu
              Container(
                margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                child: Wrap(
                  spacing: 10,
                  children: [
                    const ChoiceChip(
                      labelStyle: TextStyle(color: Colors.white),
                      label: Text('All Careers(33)'),
                      selected: true,
                      selectedColor: primaryColor,
                      labelPadding: EdgeInsets.symmetric(horizontal: Dimen.largeSpace, vertical: Dimen.smallSpace),
                    ),
                    ChoiceChip(
                      label: Text(
                        'Software Engineering & IT (15)',
                        style: CustomTextStyle.captionTextStyle(color: primaryColor, bold: true),
                      ),
                      disabledColor: Colors.white,
                      side: const BorderSide(color: primaryColor),
                      selected: false,
                    ),
                    const ChoiceChip(
                      label: Text('Business (10)'),
                      selected: false,
                    ),
                    const ChoiceChip(
                      label: Text('Sales & Marketing (5)'),
                      selected: false,
                    ),
                    const ChoiceChip(
                      label: Text('Data Science & Analytics (3)'),
                      selected: false,
                    ),
                  ],
                ),
              ),
              // * Career List
              Container(
                margin: const EdgeInsets.only(top: Dimen.largeSpace),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ItemCareer(
                      onTap: () => context.push(destination: const CareerDetailPage()),
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
