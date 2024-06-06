import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UniversityDetailPage extends StatefulWidget {
  final int universityId;
  final String? coverImageUrl;
  final String? logoImageUrl;
  final UniversityModels universityModels;
  const UniversityDetailPage({
    super.key,
    required this.universityId,
    this.coverImageUrl,
    this.logoImageUrl,
    required this.universityModels,
  });

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> with TickerProviderStateMixin {
  // * Tab Controller
  late TabController _tabController;

  // * Modal
  final _progressDialog = ProgressDialog();

  // * Models
  UniversityOverviewModels? _universityOverviewModel;
  UniversityAdmissionModels? _universityAdmissionModel;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    // * Request University Overview
    context.read<UniversityBloc>().add(RequestUniversityOverviewEvent(id: widget.universityId));
    // * Request University Admission
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          // * Request University Overview
          context.read<UniversityBloc>().add(RequestUniversityOverviewEvent(id: widget.universityId));
          break;
        case 1:
          // * Request University Programs
          break;
        case 2:
          // * Request University Admissions
          context.read<UniversityBloc>().add(RequestUniversityAdmissionEvent(id: widget.universityId));
          break;
        case 3:
          // * Request University Costs
          break;
        case 4:
          // * Request University Scholarships
          break;
        default:
          break;
      }
    }
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
      child: _universityOverviewModel != null
          ? SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimen.contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Overview
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: Text(
                        'Overview',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    const SizedBox(height: Dimen.mediumSpace),
                    // * Brief Details
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: Column(
                        children: [
                          _OverviewBriefDetails(
                            icon: Icons.info,
                            title: 'Type',
                            subtitle: _universityOverviewModel!.type.nameEn,
                          ),
                          _OverviewBriefDetails(
                            icon: Icons.attach_money_outlined,
                            title: 'Average Per Year After Aid',
                            subtitle: _universityOverviewModel!.averageTuition!,
                          ),
                          _OverviewBriefDetails(
                            icon: Icons.location_on_outlined,
                            title: 'Location',
                            subtitle: _universityOverviewModel!.contact!.address,
                          ),
                          _OverviewBriefDetails(
                            icon: Icons.school_outlined,
                            title: 'Graduation Rate',
                            subtitle: '${_universityOverviewModel!.graduationRate}%',
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    // * Description
                    CustomHtmlWidget(
                      data: _universityOverviewModel!.description,
                    ),
                    const SizedBox(height: Dimen.largeSpace),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: const Divider(
                        color: Colors.black,
                      ),
                    ),
                    // * Study Options
                    Container(
                      margin: const EdgeInsets.only(
                        top: Dimen.mediumSpace,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                      ),
                      child: Text(
                        'Study Options',
                        style: CustomTextStyle.largeTitleTextStyle(bold: true),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Dimen.smallSpace,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                      ),
                      child: Text(
                        'The college offers the following degrees: ',
                        style: CustomTextStyle.bodyTextStyle(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Dimen.smallSpace,
                        bottom: Dimen.mediumSpace,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                      ),
                      child: Text(
                        _universityOverviewModel!.studyOption!.map((e) => e.nameEn).join(', '),
                        style: CustomTextStyle.bodyTextStyle(bold: true),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: const Divider(
                        color: Colors.black,
                      ),
                    ),
                    // * Contact
                    Container(
                      margin: const EdgeInsets.only(
                        top: Dimen.mediumSpace,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Information',
                            style: CustomTextStyle.titleTextStyle(bold: true),
                          ),
                          const SizedBox(height: Dimen.largeSpace),
                          _ContactItem(
                            icon: Icons.location_on_outlined,
                            title: Text(
                              _universityOverviewModel!.contact!.address,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                          _ContactItem(
                            icon: Icons.phone_outlined,
                            title: Text.rich(TextSpan(
                              text: _universityOverviewModel!.contact!.primaryPhoneNumber,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                              children: [
                                TextSpan(
                                  text: _universityOverviewModel!.contact!.secondPhoneNumber != null
                                      ? ', ${_universityOverviewModel!.contact!.secondPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                                TextSpan(
                                  text: _universityOverviewModel!.contact!.thirdPhoneNumber != null
                                      ? ', ${_universityOverviewModel!.contact!.thirdPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                              ],
                            )),
                          ),
                          _ContactItem(
                            icon: Icons.email_outlined,
                            title: Text(
                              _universityOverviewModel!.contact!.email,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget get _builtProgramsTab {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Admission
        if (state is RequestUniversityAdmissionSuccessState) {
          // * Set University Admission Model
          _universityAdmissionModel = state.response.body.data.first;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Admission
        if (state is RequestUniversityAdmissionErrorState) {
          // * Return
          return;
        }
      },
      child: _universityAdmissionModel != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimen.contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Admissions
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                      child: Text(
                        'Admissions Overview',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: Column(
                        children: [
                          _AdmissionBriefDetails(
                            title: 'Acceptance Number',
                            subtitle: '${_universityAdmissionModel!.averageStudentAcceptance.toString()} people',
                            icon: Assets.iconAcceptance,
                          ),
                          _AdmissionBriefDetails(
                            title: 'Regular Application Due',
                            subtitle: _universityAdmissionModel!.applicationDeadline,
                            icon: Assets.iconCalendar,
                          ),
                          _AdmissionBriefDetails(
                            title: 'Application Fee',
                            subtitle: '${_universityAdmissionModel!.applicationFee ?? 'Free'}\$',
                            icon: Assets.iconApplication,
                          ),
                          _AdmissionBriefDetails(
                            title: 'Enrollment Type',
                            subtitle: _universityAdmissionModel!.enrollTypeEn,
                            icon: Assets.iconEnrollType,
                          ),
                          _AdmissionBriefDetails(
                            title: 'Tuition',
                            subtitle: '${_universityAdmissionModel!.tuition}\$',
                            icon: Assets.iconMoney,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                      child: CustomHtmlWidget(
                        data: _universityAdmissionModel!.descriptionEn,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
                      child: const Divider(
                        color: Colors.black,
                      ),
                    ),
                    // * Contact
                    Container(
                      margin: const EdgeInsets.only(
                        top: Dimen.mediumSpace,
                        left: Dimen.contentPadding,
                        right: Dimen.contentPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Information',
                            style: CustomTextStyle.titleTextStyle(bold: true),
                          ),
                          const SizedBox(height: Dimen.largeSpace),
                          _ContactItem(
                            icon: Icons.location_on_outlined,
                            title: Text(
                              _universityAdmissionModel!.contactInfo.address,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                          _ContactItem(
                            icon: Icons.phone_outlined,
                            title: Text.rich(TextSpan(
                              text: _universityAdmissionModel!.contactInfo.primaryPhoneNumber,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                              children: [
                                TextSpan(
                                  text: _universityAdmissionModel!.contactInfo.secondPhoneNumber != null
                                      ? '/${_universityAdmissionModel!.contactInfo.secondPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                                TextSpan(
                                  text: _universityAdmissionModel!.contactInfo.thirdPhoneNumber != null
                                      ? '/${_universityAdmissionModel!.contactInfo.thirdPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                              ],
                            )),
                          ),
                          _ContactItem(
                            icon: Icons.email_outlined,
                            title: Text(
                              _universityOverviewModel!.contact!.email,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
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

class _OverviewBriefDetails extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _OverviewBriefDetails({required this.icon, required this.title, required this.subtitle});

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

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final Widget title;

  const _ContactItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon, color: Colors.black),
      title: title,
    );
  }
}

class _AdmissionBriefDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const _AdmissionBriefDetails({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: SvgPicture.asset(
        icon,
        width: 35,
        height: 35,
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
