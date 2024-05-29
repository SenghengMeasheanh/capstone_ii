import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
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
          padding: const EdgeInsets.only(
              top: Dimen.extraLargeSpace, left: Dimen.contentPadding, right: Dimen.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Title
              Text('University', style: CustomTextStyle.largeTitleTextStyle(bold: true)),
              const SizedBox(height: Dimen.mediumSpace),
              // * Search Bar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) => {},
              ),
              const SizedBox(height: Dimen.extraLargeSpace),
              // * Filter Menu
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: Dimen.mediumSpace,
                mainAxisSpacing: Dimen.mediumSpace,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: UniversityFilterMenu.values
                    .map(
                      (e) => ItemUniversityFilter(title: getUniversityFilterMenuTitle(value: e)),
                    )
                    .toList(),
              ),
              // * Some description
              const SizedBox(height: Dimen.extraLargeSpace),
              // * Description Title
              Text('Find the right colleges for you', style: CustomTextStyle.titleTextStyle(bold: true)),
              const SizedBox(height: Dimen.mediumSpace),
              // * Description Text
              Text(
                'Use the filters above to narrow your search to schools that are a good fit for you.',
                style: CustomTextStyle.bodyTextStyle(),
              ),
              const SizedBox(height: Dimen.extraLargeSpace),
              // * Result and Filter
              Row(
                children: [
                  // * Result
                  Text('40 results', style: CustomTextStyle.titleTextStyle(bold: true)),
                  const Spacer(),
                  // * Filter
                  Text('Filter', style: CustomTextStyle.bodyTextStyle()),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              const SizedBox(height: Dimen.extraLargeSpace),
              // * University List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context, index) => const SizedBox(height: Dimen.defaultSpace),
                itemBuilder: (context, index) => ItemUniversity(
                  onTap: () => context.push(destination: const UniversityDetailPage()),
                  imageUrl: 'https://cambodiainvestmentreview.com/wp-content/uploads/2022/03/CADT-0-scaled.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
