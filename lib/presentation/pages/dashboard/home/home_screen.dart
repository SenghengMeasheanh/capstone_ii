import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // * Controller
  final _searchBarController = TextEditingController();

  // * Dummy Data
  List<String> images = [
    'https://images.daznservices.com/di/library/DAZN_News/93/c7/devin-haney-vs-ryan-garcia-promo-art_8q1j8kix4h2f1jsggsqpu0u71.jpg?t=-988126179',
    'https://images.squarespace-cdn.com/content/v1/622100331a5f6258ce172735/c418da0d-1277-404c-8c91-1b14d078dac0/532452769368407943.jpeg',
    'https://www.wwe.com/f/styles/wwe_large/public/all/2024/04/20240314_WM40_Match_USTitle_FC_tonight--fe130dabb803acea2d41f160726019b5.jpg'
  ];

  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    languageStreamController.stream.listen((_) => setState(() {}));
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home', style: CustomTextStyle.titleTextStyle(fontSize: 30, bold: true)),
          actions: [
            IconButton(
              onPressed: () => context.push(destination: const NotificationPage()),
              icon: const Icon(
                Icons.notifications,
                size: 31,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              children: [
                // * Search Bar
                SearchBarWidget(
                  controller: _searchBarController,
                  onChange: (value) => {},
                ),
                const SizedBox(height: Dimen.mediumSpace),
                // * Menu
                GridView.count(
                  clipBehavior: Clip.antiAlias,
                  crossAxisCount: 3,
                  crossAxisSpacing: Dimen.mediumSpace,
                  mainAxisSpacing: Dimen.mediumSpace,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: Menu.values
                      .map(
                        (e) => _MenuIcon(
                          onTap: () => context.push(
                            destination: getMenuRoute(value: e),
                          ),
                          icon: SvgPicture.asset(
                            getIconMenu(value: e),
                            width: 30,
                            height: 30,
                          ),
                          title: getMenuTitle(value: e),
                        ),
                      )
                      .toList(),
                ),
                // * Title
                Container(
                  margin: const EdgeInsets.only(top: Dimen.largeSpace),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular University',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Dimen.mediumSpace),
                // * Long Slides
                CarouselSlider(
                  items: images.map((e) => ItemSlideShow(imageUrl: e)).toList(),
                  options: CarouselOptions(
                    padEnds: false,
                    height: 180,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: false,
                    viewportFraction: 0.95,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) => setState(() => _currentIndex = index),
                  ),
                ),
                // // * Title
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: Dimen.mediumSpace),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         ' Events',
                //         style: CustomTextStyle.titleTextStyle(),
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text('View All'),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: Dimen.mediumSpace),
                // // * Long Slides
                // CarouselSlider(
                //   items: smallImages.map((e) => ItemSlideShow(imageUrl: e)).toList(),
                //   options: CarouselOptions(
                //     height: 220,
                //     padEnds: false,
                //     enlargeCenterPage: false,
                //     aspectRatio: 16 / 9,
                //     viewportFraction: 0.43,
                //     initialPage: 0,
                //     enableInfiniteScroll: false,
                //     reverse: false,
                //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     scrollDirection: Axis.horizontal,
                //     onPageChanged: (index, reason) => setState(() => _currentIndex = index),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}

class _MenuIcon extends StatelessWidget {
  final void Function() onTap;
  final dynamic icon;
  final String title;

  const _MenuIcon({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          color: secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * Icon
            icon,
            // * Title
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              alignment: Alignment.center,
              child: Text(
                tr(title),
                style: CustomTextStyle.captionTextStyle(bold: true),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
