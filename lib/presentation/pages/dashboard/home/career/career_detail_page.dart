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

class _CareerDetailPageState extends State<CareerDetailPage>
    with TickerProviderStateMixin {
  // * Tab Controller
  late TabController _tabController;

  // * Variable
  var _isReadMore = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: true,
              pinned: true,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Dimen.contentPadding),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.6),
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      border: const Border(
                        bottom: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    labelColor: primaryColor,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Job',
                      ),
                      Tab(
                        text: 'Company',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildJobDetail,
            _buildCompanyDetail,
          ],
        ),
      ),
    );
  }

  Widget get _buildJobDetail {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.contentPadding, vertical: Dimen.defaultSpace),
        child: Column(
          children: [
            // * Profile Insight
            Container(
              alignment: Alignment.centerLeft,
              // * Title
              child: Text(
                'Profile Insight',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
            ),
            // * Profile Insight Content
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              alignment: Alignment.centerLeft,
              child: Text(
                'Find out how your skills align with the job description',
                style:
                    CustomTextStyle.captionTextStyle(color: captionTextColor),
              ),
            ),
            // * Divider
            Container(
              margin: const EdgeInsets.only(top: Dimen.defaultSpace),
              child: const Divider(
                color: captionTextColor,
              ),
            ),
            // * Job Details
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.centerLeft,
              // * Title
              child: Text(
                'Job Details',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
            ),
            // * Job Details Content
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              alignment: Alignment.centerLeft,
              child: Text(
                'Here\'s how the job details align with you profile',
                style:
                    CustomTextStyle.captionTextStyle(color: captionTextColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              child: const _JobDetailItem(
                title: 'Pay',
                content: '\$172,000 - \$257,000 a year',
                icon: Assets.iconMoney,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              child: const _JobDetailItem(
                title: 'Job Type',
                content: 'Full-time',
                icon: Assets.iconAccount,
              ),
            ),
            // * Divider
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              child: const Divider(
                color: captionTextColor,
              ),
            ),
            // * Location
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.centerLeft,
              // * Title
              child: Text(
                'Location',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
            ),
            // * Location Content
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                ),
                title: Text(
                  '63 Market Street, Los Angeles, CA 90291',
                  style: CustomTextStyle.titleTextStyle(
                    color: captionTextColor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            // * Divider
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              child: const Divider(
                color: captionTextColor,
              ),
            ),
            // * Benefits
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.centerLeft,
              // * Title
              child: Text(
                'Benefits',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
            ),
            // * Benefits Content
            Container(
              margin: const EdgeInsets.only(top: Dimen.smallSpace),
              alignment: Alignment.centerLeft,
              child: Text(
                'Pulled from the full job description',
                style:
                    CustomTextStyle.captionTextStyle(color: captionTextColor),
              ),
            ),
            // * Benefits List
            Container(
              margin: const EdgeInsets.only(top: Dimen.defaultSpace),
              alignment: Alignment.centerLeft,
              child: Text(
                '• Health insurance',
                style: CustomTextStyle.titleTextStyle(
                    color: captionTextColor, bold: true),
              ),
            ),
            // * Divider
            Container(
              margin: const EdgeInsets.only(top: Dimen.largeSpace),
              child: const Divider(
                color: captionTextColor,
              ),
            ),
            // * Full Job Description
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.centerLeft,
              // * Title
              child: Text(
                'Full Job Description',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
            ),
            // * Full Job Description Content
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.centerLeft,
              child: Text(
                'Snap Inc is a technology company. We believe the camera presents the greatest opportunity to improve the way people live and communicate.Snap contributes to human progress by empowering people to express themselves, live in the moment, learn about the world, and have fun together. The Company’s three core products are Snapchat , a visual messaging app that enhances your relationships with friends, family, and the world.',
                style:
                    CustomTextStyle.captionTextStyle(color: captionTextColor),
                maxLines: _isReadMore ? null : 2,
                overflow:
                    _isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
            // * See More Button
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _isReadMore = !_isReadMore;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: primaryColor,
                  ),
                ),
                child:
                    Text(_isReadMore ? 'See less' : 'See full job description'),
              ),
            ),
            // * Apply Button
            Container(
              margin: const EdgeInsets.only(top: Dimen.largeSpace),
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: () {},
                iconAlignment: IconAlignment.end,
                icon: SvgPicture.asset(
                  Assets.iconApplyNow,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                label: Text(
                  'Apply Now',
                  style: CustomTextStyle.buttonTextStyle(),
                ),
              ),
            ),
            // * Save Job Button
            Container(
              margin: const EdgeInsets.only(
                  top: Dimen.mediumSpace, bottom: Dimen.largeSpace),
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: () {},
                iconAlignment: IconAlignment.start,
                icon: SvgPicture.asset(
                  Assets.iconBookmark,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                label: Text(
                  'Save Job',
                  style: CustomTextStyle.buttonTextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobDetailItem extends StatelessWidget {
  final String title;
  final String content;
  final String icon;
  const _JobDetailItem({
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(
        horizontal: -2,
        vertical: 4,
      ),
      leading: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: CustomTextStyle.bodyTextStyle(bold: true),
      ),
      subtitle: Text(
        content,
        style: CustomTextStyle.captionTextStyle(
            color: Colors.black,
            backgroundColor: captionTextColor.withOpacity(0.3)),
      ),
    );
  }
}

//start _company_detail

Widget get _buildCompanyDetail {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Title
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'About the Company',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
          ),
          const SizedBox(height: Dimen.mediumSpace),

          // * CEO Section
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(Dimen.defaultRadius),
            ),
            child: Row(
              children: [
                CustomCachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiTQVVjwajkFje8XOsbOWvcpfOgUMr53MJmk3RJ97-mvdLXAQVZYQiz6xbQFr6LzWWne4&usqp=CAU', // Replace with actual CEO image URL
                  config: CustomCachedNetworkImageConfig(
                    width: 80,
                    height: 80,
                    boxFit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                  ),
                ),
                const SizedBox(width: Dimen.mediumSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe', 
                      style: CustomTextStyle.titleTextStyle(bold: true),
                    ),
                    const SizedBox(height: Dimen.smallSpace),
                    Text(
                      'CEO',
                      style: CustomTextStyle.bodyTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimen.largeSpace),
          // * Founded and Company Size
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 160,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Founded',
                      style: CustomTextStyle.titleTextStyle(
                          bold: true, fontSize: 16),
                    ),
                    const SizedBox(height: Dimen.largeSpace),
                    Text(
                      '1996', 
                      style: CustomTextStyle.bodyTextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 160,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Size',
                      style: CustomTextStyle.titleTextStyle(
                          bold: true, fontSize: 16),
                    ),
                    const SizedBox(height: Dimen.largeSpace),
                    Text(
                      '100 - 500 employees',
                      style: CustomTextStyle.bodyTextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimen.largeSpace),

          Text(
            'Snap Inc is a technology company. We believe the camera presents the greatest opportunity to improve the way people live and communicate. Snap contributes to human progress by empowering people to express themselves, live in the moment, learn about the world, and have fun together. The Company’s three core products are Snapchat, a visual messaging app that enhances your relationships with friends, family, and the world.', // Replace with actual company description
            style: CustomTextStyle.bodyTextStyle(),
          ),
          Container(
            margin: const EdgeInsets.only(top: Dimen.defaultSpace),
            child: const Divider(
              color: captionTextColor,
            ),
          ),
          const SizedBox(height: Dimen.mediumSpace),
          // * Company Details
          Text(
            'Company Details',
            style: CustomTextStyle.titleTextStyle(bold: true),
          ),
          const SizedBox(height: Dimen.mediumSpace),

          Text(
            'Head Quarters',
            style: CustomTextStyle.titleTextStyle(bold: true, fontSize: 18),
          ),
          const SizedBox(height: Dimen.smallSpace),
          Text(
            'San Francisco, California, United States',
            style: CustomTextStyle.bodyTextStyle(fontSize: 14),
          ),
          const SizedBox(height: Dimen.largeSpace),
          Text(
            'Revenue',
            style: CustomTextStyle.titleTextStyle(bold: true, fontSize: 18),
          ),
          const SizedBox(height: Dimen.smallSpace),
          Text(
            'hidden by employees',
            style: CustomTextStyle.bodyTextStyle(),
          ),
          const SizedBox(height: Dimen.largeSpace),
          Text(
            'Employee',
            style: CustomTextStyle.titleTextStyle(bold: true, fontSize: 18),
          ),
          const SizedBox(height: Dimen.smallSpace),
          Text(
            '100 - 500  employees',
            style: CustomTextStyle.bodyTextStyle(),
          ),
          const SizedBox(height: Dimen.largeSpace),
          Text(
            'Indestry',
            style: CustomTextStyle.titleTextStyle(bold: true, fontSize: 18),
          ),
          const SizedBox(height: Dimen.smallSpace),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'www.sokpiseyKH24.com',
                  style:
                      CustomTextStyle.bodyTextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://www.linkedin.com/feed/'); // Open LinkedIn profile in browser or perform any action
                    },
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.link,
                    size: 18,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimen.largeSpace),
          Text(
            'Links',
            style: CustomTextStyle.titleTextStyle(bold: true, fontSize: 18),
          ),
          const SizedBox(height: Dimen.smallSpace),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'LinkedIn',
                  style:
                      CustomTextStyle.bodyTextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://www.linkedin.com/feed/'); // Open LinkedIn profile in browser or perform any action
                    },
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.link,
                    size: 18,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimen.smallSpace),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Website',
                  style:
                      CustomTextStyle.bodyTextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://www.linkedin.com/feed/'); // Open company website in browser or perform any action
                    },
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.link,
                    size: 18,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimen.largeSpace),
        ],
      ),
    ),
  );
}
