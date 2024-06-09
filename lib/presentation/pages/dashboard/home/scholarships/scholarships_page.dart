import 'package:capstone_ii/presentation/pages/dashboard/home/scholarships/scholarships_detail/scholarship_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/widgets/search_bar_widget.dart';
import 'package:capstone_ii/helper/utils/navigator_utils.dart';
import 'package:capstone_ii/presentation/items/item_scholarship.dart';

class ScholarshipsPage extends StatefulWidget {
  const ScholarshipsPage({super.key});

  @override
  _ScholarshipsPageState createState() => _ScholarshipsPageState();
}

class _ScholarshipsPageState extends State<ScholarshipsPage> {
  //* controller for search bar
  final _searchBarController = TextEditingController();
  String _searchText = "";
  String _selectedFilter = "All Scholarships";

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
                  'Scholarships',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // Searchbar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
              // Filter Menu
              Container(
                margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                child: Wrap(
                  spacing: 10,
                  children: [
                    ChoiceChip(
                      label: Text('All Scholarships'),
                      selected: _selectedFilter == 'All Scholarships',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedFilter = 'All Scholarships';
                        });
                      },
                      selectedColor: primaryColor,
                    ),
                    ChoiceChip(
                      label: Text('100% Scholarship'),
                      selected: _selectedFilter == '100% Scholarship',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedFilter = '100% Scholarship';
                        });
                      },
                      selectedColor: primaryColor,
                    ),
                    ChoiceChip(
                      label: Text('50% Scholarship'),
                      selected: _selectedFilter == '50% Scholarship',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedFilter = '50% Scholarship';
                        });
                      },
                      selectedColor: primaryColor,
                    ),
                    ChoiceChip(
                      label: Text('Study Abroad Scholarship'),
                      selected: _selectedFilter == 'Study Abroad Scholarship',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedFilter = 'Study Abroad Scholarship';
                        });
                      },
                      selectedColor: primaryColor,
                    ),
                  ],
                ),
              ),
              // Scholarship List
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Dimen.mediumSpace),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      3, // Replace with the actual count of your scholarships
                  itemBuilder: (context, index) {
                    // Example scholarship data
                    final scholarship = {
                      'imageUrl':
                          'https://asset.cambodia.gov.kh/provincial/sites/22/2022/01/272881049_2952009725110325_3648865441051457800_n.jpg',
                      'name': 'Scholarship Name $index',
                      'description':
                          'This is a description for Scholarship $index',
                      'openDate': 'July 1, 2024',
                      'closeDate': 'August 31, 2024',
                    };

                    // Filtering logic
                    if (_selectedFilter != 'All Scholarships' &&
                        scholarship['name'] != _selectedFilter) {
                      return Container();
                    }

                    if (_searchText.isNotEmpty &&
                        !scholarship['name']
                            .toString()
                            .toLowerCase()
                            .contains(_searchText.toLowerCase())) {
                      return Container();
                    }

                    return ItemScholarship(
                      imageUrl: scholarship['imageUrl']!,
                      name: scholarship['name']!,
                      description: scholarship['description']!,
                      openDate: scholarship['openDate']!,
                      closeDate: scholarship['closeDate']!,
                      onTap: () {
                        context.push(
                          destination: ScholarshipsDetailPage(
                            imageUrl: scholarship['imageUrl']!,
                            name: scholarship['name']!,
                            description: scholarship['description']!,
                            openDate: scholarship['openDate']!,
                            closeDate: scholarship['closeDate']!,
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
