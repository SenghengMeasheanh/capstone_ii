import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/helper/styles/dimen.dart';
import 'package:capstone_ii/presentation/pages/dashboard/home/guides/guides_details/guides_details.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class GuidesPage extends StatefulWidget {

  const GuidesPage({super.key, });

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  final _searchBarController = TextEditingController();
  final List<Map<String, dynamic>> guides = [
    {
      'title': 'Your Guide to Choosing the Right University in Cambodia',
      'imageAsset': 'assets/images/guide.jpg',
      'description': 'As a high school student in Cambodia, the decision of which university to attend can be both exciting and daunting.'
    },
    {
      'title': 'Guide to Scholarship Opportunities in Cambodia',
      'imageAsset': 'assets/images/guide5.jpg',
      'description': 'Navigating the world of scholarships can be a challenge, but we are here to help you find the right opportunities.'
    },
     {
      'title': 'Your Guide to Choosing the Right University in Cambodia',
      'imageAsset': 'assets/images/guide6.jpg',
      'description': 'As a high school student in Cambodia, the decision of which university to attend can be both exciting and daunting.'
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
              //Searchbar
              SearchBarWidget(controller: _searchBarController, onChange: (value) =>{}
              ),
              //Card to display Guide blog
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: guides.length,
              itemBuilder: (context, index) {
                return   GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GuidesDetails(guideIndex: index,guides: guides,),),);
                },
                child: Card(
                    margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                    //Set the shape of the card using a rounded rectangle border with a 8 pixel redius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    //Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    //Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                        Image.asset(guides[index] ['imageAsset']
                        ),
                        //Add a container with padding that contains the card's title, text, and buttons
                      Container(
                        padding: const EdgeInsets.fromLTRB(15,15,15,0 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                //Display the card's title using a font size of 24 and a dark grey color
                                Text(
                                  guides[index] ['title'], style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                //Add a space between the title and the text
                                Container(height: 10,),
                                Text(
                                  guides[index] ['description'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600]),
                                ),
                                Container(height: 15,)
                          ],),
                      )
                        
                      ],),
                   
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