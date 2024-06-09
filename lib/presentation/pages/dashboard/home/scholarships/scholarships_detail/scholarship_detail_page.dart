import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/presentation/widgets/custom_cached_network_image_widget.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class ScholarshipsDetailPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String openDate;
  final String closeDate;

  const ScholarshipsDetailPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.openDate,
    required this.closeDate,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Scholarship Title
              Text(name,
                  style: CustomTextStyle.largeTitleTextStyle(bold: true)),
              const SizedBox(height: Dimen.mediumSpace),
              CustomCachedNetworkImage(
                imageUrl: imageUrl,
                config: CustomCachedNetworkImageConfig(
                  height: 250,
                  width: double.infinity,
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: Dimen.mediumSpace),
              Text(
                'Open Date: $openDate\nClose Date: $closeDate',
                style: CustomTextStyle.bodyTextStyle(),
              ),
              const SizedBox(height: Dimen.mediumSpace),
              Text(
                description,
                style: CustomTextStyle.bodyTextStyle(),
              ),
              const SizedBox(height: Dimen.mediumSpace),

              //*Scholarship Benefits
              Text('Scholarship Benefits:',
                  style: CustomTextStyle.titleTextStyle(bold: true)),

              Text('- 100% school paid',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- \$100 per month allowance',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Become the ICT lead in the future',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Become the ICT lead in the future',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Become the ICT lead in the future',
                  style: CustomTextStyle.bodyTextStyle()),
              Text(
                  '- Can Study at popular school in CADT, AUPP, RUPP, and ICT.',
                  style: CustomTextStyle.bodyTextStyle()),

              const SizedBox(height: Dimen.mediumSpace),
              //* Requirement Document
              Text('Requirement Document:',
                  style: CustomTextStyle.titleTextStyle(bold: true)),
              Text('- High school transcripts.',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Two letters of recommendation.',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Personal statement.',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Proof of BODIAN citizenship or permanent residency.',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Finish grade 12 with grade A,B & C',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('- Can Cook like master chef(Domzzz).',
                  style: CustomTextStyle.bodyTextStyle()),

              const SizedBox(height: Dimen.mediumSpace),
              //* How to Apply
              Text('How to Apply:',
                  style: CustomTextStyle.titleTextStyle(bold: true)),
              Text('1. Complete the online application form at University',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('2. Submit high school transcripts. ',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('3. Provide two letters of recommendation. ',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('4. Write and submit a personal statement (500 words).',
                  style: CustomTextStyle.bodyTextStyle()),
              Text('5. Attend an interview if shortlisted.',
                  style: CustomTextStyle.bodyTextStyle()),

              const SizedBox(height: Dimen.mediumSpace),
              //* Conatact information
              Row(children: [
                const Icon(Icons.email, color: primaryColor),
                const SizedBox(width: Dimen.smallSpace),
                Text('Email: 9JlT7@example.com',
                    style: CustomTextStyle.bodyTextStyle()),
              ]),
              Row(children: [
                const Icon(Icons.phone, color: primaryColor),
                const SizedBox(width: Dimen.smallSpace),
                Text('Phone: +855 123 456 789',
                    style: CustomTextStyle.bodyTextStyle()),
              ]),
              Row(
                children: [
                  const Icon(Icons.location_on, color: primaryColor),
                  const SizedBox(width: Dimen.smallSpace),
                  Text('Location: Phnom Penh, Cambodia',
                      style: CustomTextStyle.bodyTextStyle()),
                ],
              ),

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
                    'Apply Now',
                    style: CustomTextStyle.buttonTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimen.largeSpace),
            ],
          ),
        ),
      ),
    );
  }
}
