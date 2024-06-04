import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UniversityDetailPage extends StatefulWidget {
  final int universityId;
  final String? coverImageUrl;
  final String? logoImageUrl;
  final UniversityModels universityModels;
  const UniversityDetailPage(
      {super.key,
      required this.universityId,
      this.coverImageUrl,
      this.logoImageUrl,
      required this.universityModels});

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> with TickerProviderStateMixin {
  // * Tab Controller
  late TabController _tabController;

  // * Modal
  final _progressDialog = ProgressDialog();

  // * University Overiew Models
  UniversityOverviewModels? _universityOverviewModel;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    // * Request University Overview
    context.read<UniversityBloc>().add(RequestUniversityOverviewEvent(id: widget.universityId));
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
              expandedHeight: 380.h,
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
                              widget.coverImageUrl != null
                                  ? CustomCachedNetworkImage(
                                      imageUrl: widget.coverImageUrl!,
                                      config: CustomCachedNetworkImageConfig(
                                        width: double.infinity,
                                        height: 150,
                                        boxFit: BoxFit.cover,
                                        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                      ),
                                    )
                                  : Image.asset(
                                      Assets.imageNoImage,
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
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
                                  child: widget.logoImageUrl != null
                                      ? CustomCachedNetworkImage(
                                          imageUrl: widget.logoImageUrl!,
                                          config: CustomCachedNetworkImageConfig(
                                            width: 60,
                                            height: 60,
                                            boxFit: BoxFit.cover,
                                            borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                          ),
                                        )
                                      : Image.asset(
                                          Assets.imageNoImage,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          // * University Name
                          const SizedBox(height: Dimen.largeSpace),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.universityModels.name,
                                style: CustomTextStyle.titleTextStyle(bold: true),
                              ),
                              const SizedBox(height: Dimen.mediumSpace),
                              // * University Location
                              Text(
                                _universityOverviewModel != null
                                    ? _universityOverviewModel!.contact!.address
                                    : 'Loading...',
                                style: CustomTextStyle.bodyTextStyle(),
                              ),
                            ], 
                          ),
                          // * Favorite Button
                          Container(
                            margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
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
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Overview
        if (state is RequestUniversityOverviewSuccessState) {
          // * Set University Overview Model
          _universityOverviewModel = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Overview
        if (state is RequestUniversityOverviewErrorState) {
          // * Return
          return;
        }
      },
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: _universityOverviewModel != null
            ? Padding(
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
                    Column(
                      children: [
                        _BriefDetails(
                          icon: Icons.info,
                          title: 'Type',
                          subtitle: _universityOverviewModel!.type.nameEn,
                        ),
                        _BriefDetails(
                          icon: Icons.attach_money_outlined,
                          title: 'Average Per Year After Aid',
                          subtitle: _universityOverviewModel!.averageTuition!,
                        ),
                        _BriefDetails(
                          icon: Icons.location_on_outlined,
                          title: 'Location',
                          subtitle: _universityOverviewModel!.contact!.address,
                        ),
                        _BriefDetails(
                          icon: Icons.school_outlined,
                          title: 'Graduation Rate',
                          subtitle: '${_universityOverviewModel!.graduationRate}%',
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    // * Description
                    CustomHtmlWidget(
                      data: _universityOverviewModel!.description,
                    ),
                    const SizedBox(height: Dimen.largeSpace),
                    const Divider(
                      color: Colors.black,
                    ),
                    // * Study Options
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                      child: Text(
                        'Study Options',
                        style: CustomTextStyle.largeTitleTextStyle(bold: true),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.smallSpace),
                      child: Text(
                        'The college offers the following degrees: ',
                        style: CustomTextStyle.bodyTextStyle(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.smallSpace, bottom: Dimen.mediumSpace),
                      child: Text(
                        _universityOverviewModel!.studyOption!.map((e) => e.nameEn).join(', '),
                        style: CustomTextStyle.bodyTextStyle(bold: true),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    // * Contact
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Information',
                            style: CustomTextStyle.titleTextStyle(bold: true),
                          ),
                          const SizedBox(height: Dimen.largeSpace),
                          ContactItem(
                            icon: Icons.location_on_outlined,
                            title: _universityOverviewModel!.contact!.address,
                          ),
                          ContactItem(
                            icon: Icons.phone_outlined,
                            title: _universityOverviewModel!.contact!.primaryPhoneNumber,
                          ),
                          ContactItem(
                            icon: Icons.email_outlined,
                            title: _universityOverviewModel!.contact!.email,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
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

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
