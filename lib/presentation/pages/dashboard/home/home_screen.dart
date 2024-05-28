import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'https://images.daznservices.com/di/library/DAZN_News/93/c7/devin-haney-vs-ryan-garcia-promo-art_8q1j8kix4h2f1jsggsqpu0u71.jpg?t=-988126179',
    'https://images.squarespace-cdn.com/content/v1/622100331a5f6258ce172735/c418da0d-1277-404c-8c91-1b14d078dac0/532452769368407943.jpeg',
    'https://www.wwe.com/f/styles/wwe_large/public/all/2024/04/20240314_WM40_Match_USTitle_FC_tonight--fe130dabb803acea2d41f160726019b5.jpg'
  ];

  List<String> smallImages = [
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
    'https://imageio.forbes.com/specials-images/imageserve/65be17cb80f5c798a03e7762/Florian-Wirtz-could-be-signed-by-Real-Madrid-from-Bayer-Leverkusen-in-2025-/960x0.jpg?format=jpg&width=960',
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home', style: CustomTextStyle.titleTextStyle(fontSize: 30, bold: true)),
          actions: [
            IconButton(
              onPressed: () {},
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
                const SearchBarWidget(),
                const SizedBox(height: Dimen.mediumSpace),
                // * Menu
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: Dimen.mediumSpace,
                  mainAxisSpacing: Dimen.mediumSpace,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: Menu.values
                      .map(
                        (e) => _MenuIcon(
                          onTap: () => context.push(
                            destination: getMenuRoute(value: e),
                          ),
                          icon: Icon(
                            getIconMenu(value: e),
                            color: Colors.black,
                            size: 31.sp,
                          ),
                          title: getMenuTitle(value: e),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: Dimen.largeSpace),
                // * Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular University',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    )
                  ],
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
        padding: const EdgeInsets.all(Dimen.mediumSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          color: secondaryColor,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * Icon
            icon,
            // * Title
            Container(
              margin: const EdgeInsets.only(top: Dimen.mediumSpace),
              child: Text(
                title,
                style: CustomTextStyle.titleTextStyle(fontSize: Dimen.titleTextSize, bold: true),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
