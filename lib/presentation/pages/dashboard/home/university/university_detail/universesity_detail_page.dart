import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class UniversityDetailPage extends StatefulWidget {
  const UniversityDetailPage({super.key});

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 380,
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // * Cover Image and Logo
                          Stack(
                            children: [
                              CustomCachedNetworkImage(
                                imageUrl:
                                    'https://cambodiainvestmentreview.com/wp-content/uploads/2022/03/CADT-0-scaled.jpg',
                                config: CustomCachedNetworkImageConfig(
                                  width: double.infinity,
                                  height: 150,
                                  boxFit: BoxFit.cover,
                                  borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(Dimen.defaultRadius),
                                    ),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: CustomCachedNetworkImage(
                                    imageUrl:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeWHerau4p1KatwBXrCHlRSVCID1NZWxb_Q_ABKPZNWg&s',
                                    config: CustomCachedNetworkImageConfig(
                                      width: 60,
                                      height: 60,
                                      boxFit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // * University Name
                          const SizedBox(height: Dimen.largeSpace),
                          Text(
                            'CADT - Cambodia Academy of Digital Technology',
                            style: CustomTextStyle.titleTextStyle(bold: true),
                          ),
                          const SizedBox(height: Dimen.mediumSpace),
                          // * University Location
                          Text(
                            'Phnom Penh, Cambodia',
                            style: CustomTextStyle.bodyTextStyle(),
                          ),
                          // * Favorite Button
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.largeSpace),
                            width: double.infinity,
                            height: 56,
                            child: CustomButtonWithIcon(
                              onTap: () {},
                              text: 'Save to Favorite',
                              icon: Icons.favorite_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimen.largeSpace),
                  ],
                ),
              ),
              // * Tabbars
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 3.0,
                    indicatorColor: primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.black,
                    dividerHeight: 5,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Overview',
                      ),
                      Tab(
                        text: 'Programs',
                      ),
                      Tab(
                        text: 'Admissions',
                      ),
                      Tab(
                        text: 'Costs',
                      ),
                      Tab(
                        text: 'Scholarships',
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
            _builtOverviewTab,
            _builtProgramsTab,
            _builtAdmissionsTab,
            _builtCostsTab,
            _builtScholarshipsTab,
          ],
        ),
      ),
    );
  }

  Widget get _builtOverviewTab {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Dimen.contentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Overview
            Text(
              'Overview',
              style: CustomTextStyle.titleTextStyle(bold: true),
            ),
            const SizedBox(height: Dimen.mediumSpace),
            // * Brief Details
            const _BriefDetails(
              icon: Icons.info,
              title: 'Type',
              subtitle: 'Private',
            ),
            const _BriefDetails(
              icon: Icons.apartment_outlined,
              title: 'Campus Life',
              subtitle: 'Large',
            ),
            const _BriefDetails(
              icon: Icons.attach_money_outlined,
              title: 'Average Per Year After Aid',
              subtitle: '10,000',
            ),
            const _BriefDetails(
              icon: Icons.location_on_outlined,
              title: 'Location',
              subtitle: 'Phnom Penh, Cambodia',
            ),
            const _BriefDetails(
              icon: Icons.school_outlined,
              title: 'Graduation Rate',
              subtitle: '53%',
            ),
          ],
        ),
      ),
    );
  }

  Widget get _builtProgramsTab {
    return Column(
      children: [
        // * Programs
        Text(
          'Programs',
          style: CustomTextStyle.titleTextStyle(bold: true),
        ),
        const SizedBox(height: Dimen.largeSpace),
      ],
    );
  }

  Widget get _builtAdmissionsTab {
    return Column(
      children: [
        // * Admissions
        Text(
          'Admissions',
          style: CustomTextStyle.titleTextStyle(bold: true),
        ),
        const SizedBox(height: Dimen.largeSpace),
      ],
    );
  }

  Widget get _builtCostsTab {
    return Column(
      children: [
        // * Costs
        Text(
          'Costs',
          style: CustomTextStyle.titleTextStyle(bold: true),
        ),
        const SizedBox(height: Dimen.largeSpace),
      ],
    );
  }

  Widget get _builtScholarshipsTab {
    return Column(
      children: [
        // * Scholarships
        Text(
          'Scholarships',
          style: CustomTextStyle.titleTextStyle(bold: true),
        ),
        const SizedBox(height: Dimen.largeSpace),
      ],
    );
  }
}

class _BriefDetails extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _BriefDetails({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: ActionMenuIcon(
        backgroundColor: primaryColor,
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: CustomTextStyle.bodyTextStyle(),
      ),
      subtitle: Text(
        subtitle,
        style: CustomTextStyle.bodyTextStyle(),
      ),
    );
  }
}
