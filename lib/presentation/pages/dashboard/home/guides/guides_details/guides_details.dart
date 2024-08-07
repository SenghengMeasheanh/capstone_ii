import 'package:capstone_ii/helper/styles/color.dart';
import 'package:capstone_ii/presentation/items/item_guide_details.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/styles/dimen.dart';



class GuidesDetails extends StatelessWidget {
  final int guideIndex;
  final List<Map<String, dynamic>> guides;

  const GuidesDetails({
    super.key,
    required this.guides,
    required this.guideIndex,
  });

  @override
  Widget build(BuildContext context) {
    final guide = guides[guideIndex];
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
              // * Guide Title
              Text(
                guide['title'],
                style: const TextStyle(
                  fontSize: Dimen.largeTitleTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimen.defaultSpace),
              Image.asset(guide['imageAsset']),
              const SizedBox(height: Dimen.defaultSpace),
              Text(
                guide['description'],
                style: const TextStyle(
                  fontSize: Dimen.bodyTextSize,
                ),
              ),
              const SizedBox(height: Dimen.defaultSpace),
              const Divider(
                height: 20,
                thickness: 4.0,
                color: secondaryColor,
              ),
              const SizedBox(height: Dimen.defaultSpace),
              const Text(
                'Factors to Consider When Choosing a University',
                style: TextStyle(
                  fontSize: Dimen.midTitleTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimen.defaultSpace),
              _buildSection(
                'Academic Programs',
                'Think about the specific field of study you want to pursue. Does the university offer degree programs in your area of interest? Look at the curriculum, course offerings, and reputation of the academic departments.',
              ),
              _buildSection(
                'Campus Life',
                'University is about more than just academics. Consider the overall campus environment, student clubs and activities, housing options, and access to support services. A vibrant campus life can greatly enhance the university experience.',
              ),
              _buildSection(
                'Reputation and Rankings',
                'Research the reputation and rankings of universities in Cambodia. While rankings aren\'t everything, they can provide useful insights into the academic quality, research output, and graduate employment rates.',
              ),
              _buildSection(
                'Cost and Financing',
                'Evaluate the tuition fees, living expenses, and available financial aid or scholarship opportunities. Make sure to consider the overall affordability of attending the university.',
              ),
              _buildSection(
                'Location',
                'Decide whether you want to study in the capital city of Phnom Penh, a regional hub, or a more rural area. Consider factors like transportation, access to internships and job opportunities, and personal preferences.',
              ),
              const Divider(
                height: 20,
                thickness: 4.0,
                color: secondaryColor,
              ),
              const SizedBox(height: Dimen.defaultSpace),
              const Text(
                'Top Universities in Cambodia',
                style: TextStyle(
                  fontSize: Dimen.midTitleTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimen.defaultSpace),
              _buildUniversitySection(
                'Royal University of Phnom Penh (RUPP)',
                'RUPP is Cambodia\'s oldest and most prestigious public university, known for its strong programs in the sciences, social sciences, and humanities. It has a vibrant campus life and is located in the heart of Phnom Penh.',
              ),
              _buildUniversitySection(
                'University of Battambang (UBB)',
                'UBB is a public university located in the northwestern province of Battambang. It offers a range of undergraduate and graduate programs, with a particular focus on agriculture, engineering, and environmental studies.',
              ),
              _buildUniversitySection(
                'Paññāsāstra University of Cambodia (PUC)',
                'PUC is a private university in Phnom Penh that is known for its business, IT, and English language programs. It has a modern campus and a strong reputation for producing work-ready graduates.',
              ),
              _buildUniversitySection(
                'Zaman University',
                'Zaman University is a private institution in Phnom Penh that specializes in engineering, architecture, and technology-related fields. It has strong industry connections and a focus on practical, hands-on learning.',
              ),
              const SizedBox(height: 50),
              const Divider(height: 20, thickness: 2.0),
              const SizedBox(height: 50),
              _buildAuthorSection(),
              const SizedBox(height: Dimen.defaultSpace),
              _buildMoreArticlesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: Dimen.titleTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: Dimen.defaultSpace),
        Text(
          content,
          style: const TextStyle(fontSize: Dimen.bodyTextSize),
        ),
        const SizedBox(height: Dimen.defaultSpace),
      ],
    );
  }

  Widget _buildUniversitySection(String name, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: Dimen.titleTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: Dimen.defaultSpace),
        Text(
          description,
          style: const TextStyle(fontSize: Dimen.bodyTextSize),
        ),
        const SizedBox(height: Dimen.defaultSpace),
      ],
    );
  }

  Widget _buildAuthorSection() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNi0zOTcucG5n.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'AUTHOR: PathFinder',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'PathFinder helps you discover the schools and neighborhoods that are right for you.',
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: 400,
          color: const Color.fromARGB(255, 234, 230, 230),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Follow us :',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.facebook, size: 37),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {},
            child: const Text(
              'https://www.pathfinder.com/blog',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildMoreArticlesSection() {
    final List<Map<String, String>> data = [
      {
        'imageAsset': 'assets/images/guide.jpg',
        'title': 'Everything student need to know before choosing major',
        'subtitle': 'and what they should consider when making this important decision',
      },
      {
        'imageAsset': 'assets/images/guide1.jpg',
        'title': 'Preparing for college: A comprehensive guide',
        'subtitle': 'Essential tips and strategies for a successful transition',
      },
      {
        'imageAsset': 'assets/images/guide2.jpg',
        'title': 'Unlocking the secrets of effective study habits',
        'subtitle': 'Proven methods to boost academic performance',
      },
      {
        'imageAsset': 'assets/images/guide3.jpg',
        'title': 'Navigating the financial aid maze',
        'subtitle': 'Maximizing your opportunities for scholarships and grants',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ItemGuideDetails(
          imageAsset: data[index]['imageAsset']!,
          title: data[index]['title']!,
          subtitle: data[index]['subtitle']!,
        );
      },
    );
  }
}
