import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class GuidesDetails extends StatelessWidget {
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
  final int guideIndex;
  final List<Map<String, dynamic>> guides;
  
   GuidesDetails({super.key,required this.guides, required this.guideIndex });

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
              //Guide Title
              const Text(
                'Your Guide to Choosing the Right University in Cambodia',
                style: TextStyle(
                    fontSize: Dimen.largeTitleTextSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(guide['imageAsset']),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "As a high school student in Cambodia, the decision of which university to attend can be both exciting and daunting. With the growing number of higher education institutions in the country, it's important to carefully consider your options and find the right fit for your academic and career goals.In guide we'll cover the key factors to consider when selecting a university in Cambodia, as well as provide an overview of some of the top universities in the country.",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 20,
                thickness: 4.0,
                color: Color.fromARGB(255, 250, 188, 170),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Factors to Consider When Choosing a University',
                style: TextStyle(
                    fontSize: Dimen.midTitleTextSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Academic Programs',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Think about the specific field of study you want to pursue. Does the university offer degree programs in your area of interest? Look at the curriculum, course offerings, and reputation of the academic departments.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              const Text(
                'Campus Life',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'University is about more than just academics. Consider the overall campus environment, student clubs and activities, housing options, and access to support services. A vibrant campus life can greatly enhance the university experience.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              const Text(
                'Reputation an Rankings',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Research the reputation and rankings of universities in Cambodia. While rankings aren't everything, they can provide useful insights into the academic quality, research output, and graduate employment rates.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              const Text(
                'Cost and Financing',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Evaluate the tuition fees, living expenses, and available financial aid or scholarship opportunities. Make sure to consider the overall affordability of attending the university.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Location',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Decide whether you want to study in the capital city of Phnom Penh, a regional hub, or a more rural area. Consider factors like transportation, access to internships and job opportunities, and personal preferences.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 20,
                thickness: 4.0,
                color: Color.fromARGB(255, 250, 188, 170),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Top Universities in Cambodia',
                style: TextStyle(
                    fontSize: Dimen.midTitleTextSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Royal University of Phnom Penh (RUPP)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "RUPP is Cambodia's oldest and most prestigious public university, known for its strong programs in the sciences, social sciences, and humanities. It has a vibrant campus life and is located in the heart of Phnom Penh.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'University of Battambang (UBB)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'UBB is a public university located in the northwestern province of Battambang. It offers a range of undergraduate and graduate programs, with a particular focus on agriculture, engineering, and environmental studies.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Paññāsāstra University of Cambodia (PUC)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' PUC is a private university in Phnom Penh that is known for its business, IT, and English language programs. It has a modern campus and a strong reputation for producing work-ready graduates.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Zaman University',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Zaman University is a private institution in Phnom Penh that specializes in engineering, architecture, and technology-related fields. It has strong industry connections and a focus on practical, hands-on learning.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                height: 20,
                thickness: 2.0,
              ),
              const SizedBox(
                height: 50,
              ),

//Bottom section

              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNi0zOTcucG5n.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'AUTHOR: PathFinder',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  const Text(
                      'PathFinder helps you discover the schools and neighborhoods that are right for you.'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    color: const Color.fromARGB(255, 234, 230, 230),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Follow us :',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'https://www.pathfinder.com/blog',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    ' Read More Articles by PathFinder',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),

                ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Image.asset(
                  data[index]['imageAsset']!,
                  height: 120,
                  width: 120,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['title']!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        data[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2.0,
            ),
            const SizedBox(height: 15),
          ],
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
