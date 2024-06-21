import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class FinancialAidPage extends StatefulWidget {
  const FinancialAidPage({super.key});

  @override
  State<FinancialAidPage> createState() => _FinancialAidPageState();
}

class _FinancialAidPageState extends State<FinancialAidPage> {
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
                  'Financial Aid',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                ),
              ),
              // Searchbar
              SearchBarWidget(
                controller: _searchBarController,
                onChange: (value) => {},
              ),
              const SizedBox(height: Dimen.mediumSpace),
              // Financial Aid Items List
              ListView.builder(
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2, // Replace with your actual item count
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                    child: ItemFinancialAid(
                      imageUrl:
                          'https://www.alleducationschools.com/wp-content/uploads/2018/03/careers-student-teacher.jpg',
                      title: 'Financial Aid Title $index',
                      description:
                          'This is a short description of the financial aid $index.',
                      onTap: () {
                        context.push(
                          destination: FinancialAidDetailPage(
                            
                          ),
                        );
                      },
                    ),
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
