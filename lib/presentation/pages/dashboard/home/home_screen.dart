import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // * Popular List
  var _popularUniversityList = <UniversityModels>[];
  var _popularCareerList = <CareerModels>[];

  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // * Listen to Language Change
    languageStreamController.stream.listen((_) => setState(() {}));
    // * Request Popular University List
    context.read<PopularBloc>().add(RequestPopularUniversityListEvent());
    // * Request Popular Career List
    context.read<PopularBloc>().add(RequestPopularCareerListEvent());
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
          title: Text(tr(LocaleKeys.home), style: CustomTextStyle.titleTextStyle(fontSize: 30, bold: true)),
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
        body: BlocListener<PopularBloc, PopularState>(
          listener: (context, state) {
            // * Request Popular University List Success
            if (state is RequestPopularUniversityListSuccessState) {
              // * Init Popular University List
              _popularUniversityList = state.response.body.data;
              // * Notify
              setState(() {});
              // * Return
              return;
            }
            // * Request Popular Career List Success
            if (state is RequestPopularCareerListSuccessState) {
              // * Init Popular Career List Success
              _popularCareerList = state.response.body.data;
              // * Notify
              setState(() {});
              // * Return
              return;
            }
          },
          child: SingleChildScrollView(
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
                          tr(LocaleKeys.popular_university),
                          style: CustomTextStyle.titleTextStyle(bold: true),
                        ),
                        TextButton(
                          onPressed: () => context.push(destination: const UniversityPage()),
                          child: Text(tr(LocaleKeys.view_all)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                  // * Popular University List
                  Visibility(
                    visible: _popularUniversityList.isNotEmpty,
                    replacement: const ProgressBar(),
                    child: CarouselSlider(
                      items: _popularUniversityList
                          .map(
                            (e) => ItemSlideShow(
                              imageUrl: e.image!,
                              onTap: () => context.push(
                                destination: UniversityDetailPage(
                                  universityId: e.id,
                                  universityName: e.name,
                                  pathName: e.nameEn,
                                  coverImageUrl: e.image,
                                  logoImageUrl: e.logoImage,
                                ),
                              ),
                            ),
                          )
                          .toList(),
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr(LocaleKeys.popular_career),
                          style: CustomTextStyle.titleTextStyle(bold: true),
                        ),
                        TextButton(
                          onPressed: () => context.push(destination: const CareerPage()),
                          child: Text(tr(LocaleKeys.view_all)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                  // * Popular Carrer List
                  Visibility(
                    visible: _popularCareerList.isNotEmpty,
                    replacement: const ProgressBar(),
                    child: CarouselSlider(
                      items: _popularCareerList
                          .map(
                            (e) => ItemSlideShow(
                              imageUrl: e.image,
                              onTap: () => context.push(
                                destination: CareerDetailPage(id: e.id),
                              ),
                            ),
                          )
                          .toList(),
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
                  ),
                ],
              ),
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
