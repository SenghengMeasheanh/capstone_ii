import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CareerDetailPage extends StatefulWidget {
  const CareerDetailPage({super.key});

  @override
  State<CareerDetailPage> createState() => _CareerDetailPageState();
}

class _CareerDetailPageState extends State<CareerDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: Dimen.largeSpace,
                    right: Dimen.largeSpace,
                    top: Dimen.defaultSpace,
                    bottom: Dimen.largeSpace * 2 + 4,
                  ),
                  width: double.infinity,
                  color: primaryColor.withOpacity(0.3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Job Title
                      Text(
                        'Software Engineer - Front End (React)',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                      // * Company Address
                      Text(
                        '63 Market Street, Los Angeles, CA 90291',
                        style: CustomTextStyle.captionTextStyle(),
                      ),
                      // * Salary and // * Work Shift
                      Text(
                        '\$172,000 - \$257,000 a year - Full-time',
                        style: CustomTextStyle.captionTextStyle(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 22,
                  top: 77,
                  child: CustomCachedNetworkImage(
                    imageUrl: 'https://wallpapercave.com/wp/wp6810857.png',
                    config: CustomCachedNetworkImageConfig(
                      width: 81,
                      height: 64,
                      borderRadius: BorderRadius.circular(5),
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
