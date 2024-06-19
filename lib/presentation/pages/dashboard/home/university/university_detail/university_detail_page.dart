import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  // * Paging Controller
  final _universityMajorController = PagingController<int, UniversityMajorModels>(firstPageKey: 1);
  final _universitySpecializeController = PagingController<int, UniversitySpecializeModels>(firstPageKey: 1);
  final _universityTuitionController = PagingController<int, UniversityTuitionModels>(firstPageKey: 1);
  final _universityScholarshipController = PagingController<int, UniversityScholarshipModels>(firstPageKey: 1);
  final _universityEventController = PagingController<int, UniversityEventModels>(firstPageKey: 1);

  // * Models
  UniversityOverviewModels? _universityOverviewModel;
  UniversityAdmissionModels? _universityAdmissionModel;
  var _degreeLevelsList = <DegreeLevelsModels>[];
  UniversityMajorDetailModels? _universityMajorDetailModel;
  UniversitySpecializeDetailModels? _universitySpecializeDetailModel;
  UniversityScholarshipDetailModels? _universityScholarshipDetailModel;
  UniversityEventDetailModels? _universityEventDetailModel;

  // * Variables
  var _selectedDegreeLevelId = 0;
  var _showMajorDetail = false;
  var _showSpecializeDetail = false;
  var _showScholarshipDetail = false;
  var _showEventDetail = false;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    // * Request University Overview
    context.read<UniversityBloc>().add(RequestUniversityOverviewEvent(id: widget.universityId));
    // * Request University Admission
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _universityMajorController.dispose();
    _universitySpecializeController.dispose();
    _universityTuitionController.dispose();
    _universityScholarshipController.dispose();
    _universityEventController.dispose();
    super.dispose();
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
          context.read<UniversityBloc>().add(RequestUniversityDegreeLevelsListEvent(id: widget.universityId));
          break;
        case 2:
          // * Request University Admissions
          context.read<UniversityBloc>().add(RequestUniversityAdmissionEvent(id: widget.universityId));
          break;
        case 3:
          // * Request University Scholarships
          context.read<UniversityBloc>().add(RequestUniversityScholarshipListEvent(id: widget.universityId));
          break;
        case 4:
          // * Request University Event
          context.read<UniversityBloc>().add(RequestUniversityEventListEvent(id: widget.universityId));
          break;
        case 5:
          // * Request University Tuition
          context.read<UniversityBloc>().add(RequestUniversityTuitionListEvent(id: widget.universityId));
          break;
        default:
          break;
      }
    }
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
              expandedHeight: MediaQuery.of(context).size.height < 883
                  ? MediaQuery.of(context).size.height * 0.52
                  : MediaQuery.of(context).size.height * 0.45,
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
                    onTap: (value) => {
                      if (value == 1)
                        {
                          setState(() {
                            _showMajorDetail = false;
                            _showSpecializeDetail = false;
                          })
                        },
                      if (value == 3)
                        {
                          setState(() {
                            _showScholarshipDetail = false;
                          })
                        },
                      if (value == 4)
                        {
                          setState(() {
                            _showEventDetail = false;
                          })
                        }
                    },
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
                        text: 'Scholarships',
                      ),
                      Tab(
                        text: 'Event',
                      ),
                      Tab(
                        text: 'Tuition',
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
            _buildOverviewTab,
            _showMajorDetail
                ? _buildMajorDetail
                : _showSpecializeDetail
                    ? _buildSpecializeDetail
                    : _buildProgramsTab,
            _buildAdmissionsTab,
            _showScholarshipDetail ? _buildScholarshipDetail : _buildScholarshipsTab,
            _showEventDetail ? _buildEventDetail : _buildEventTab,
            _buildTuitionTab,
          ],
        ),
      ),
    );
  }

  Widget get _buildOverviewTab {
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
                padding: const EdgeInsets.all(Dimen.contentPadding),
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
                    Column(
                      children: [
                        _OverviewBriefDetails(
                          icon: Icons.info,
                          title: 'Type',
                          subtitle: _universityOverviewModel!.type.name,
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
                      margin: const EdgeInsets.only(
                        top: Dimen.smallSpace,
                        bottom: Dimen.mediumSpace,
                      ),
                      child: Text(
                        _universityOverviewModel!.studyOption!.map((e) => e.name).join(', '),
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
                          _ContactItem(
                            icon: Icons.location_on_outlined,
                            title: Text(
                              _universityOverviewModel!.contact!.address,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                          _ContactItem(
                            icon: Icons.phone_outlined,
                            title: Text.rich(
                              TextSpan(
                                text: _universityOverviewModel!.contact!.primaryPhoneNumber,
                                style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => openURILauncher(
                                        launchURL: 'tel:${_universityOverviewModel!.contact!.primaryPhoneNumber}',
                                      ),
                                children: [
                                  TextSpan(
                                    text: _universityOverviewModel!.contact!.secondPhoneNumber != null
                                        ? ', ${_universityOverviewModel!.contact!.secondPhoneNumber}'
                                        : '',
                                    style: CustomTextStyle.bodyTextStyle(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => openURILauncher(
                                            launchURL:
                                                'tel:${_universityOverviewModel!.contact!.secondPhoneNumber}',
                                          ),
                                  ),
                                  TextSpan(
                                    text: _universityOverviewModel!.contact!.thirdPhoneNumber != null
                                        ? ', ${_universityOverviewModel!.contact!.thirdPhoneNumber}'
                                        : '',
                                    style: CustomTextStyle.bodyTextStyle(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => openURILauncher(
                                            launchURL:
                                                'tel:${_universityOverviewModel!.contact!.thirdPhoneNumber}',
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _ContactItem(
                            icon: Icons.email_outlined,
                            title: InkWell(
                              onTap: () => openURILauncher(launchURL: _universityOverviewModel!.contact!.email),
                              child: Text(
                                _universityOverviewModel!.contact!.email,
                                style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                              ),
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

  Widget get _buildProgramsTab {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Degree Levels List Success
        if (state is RequestUniversityDegreeLevelsListSuccessState) {
          // * Set Degree Levels List
          _degreeLevelsList = state.response.body.data;
          // * Set Selected Degree Level
          _selectedDegreeLevelId = _degreeLevelsList.first.id;
          // * Request University Major List and Specialize List
          _onChangeDegreeLevel(_selectedDegreeLevelId);
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // * Request University Major List Success
        if (state is RequestUniversityMajorListSuccessState) {
          // * Set University Major List
          _universityMajorController.itemList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // * Request University Specialize List Success
        if (state is RequestUniversitySpecializeListSuccessState) {
          // * Set University Specialize List
          _universitySpecializeController.itemList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Degree Levels List Error
        if (state is RequestUniversityDegreeLevelsListErrorState) {
          // * Return
          return;
        }
        // ! Request University Major List Error
        if (state is RequestUniversityMajorListErrorState) {
          // * Return
          return;
        }
        // ! Request University Specialize List Error
        if (state is RequestUniversitySpecializeListErrorState) {
          // * Return
          return;
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          // * Request University Degree Levels List
          context.read<UniversityBloc>().add(RequestUniversityDegreeLevelsListEvent(id: widget.universityId));
          _universityMajorController.refresh();
          _universitySpecializeController.refresh();
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: Dimen.mediumSpace,
                  children: _degreeLevelsList.map((e) {
                    return _DegreeLevelsMenu(
                      label: e.name,
                      isSelected: _selectedDegreeLevelId == e.id,
                      onSelected: (value) {
                        _onChangeDegreeLevel(e.id);
                      },
                    );
                  }).toList(),
                ),
                // * Major
                Container(
                  margin: const EdgeInsets.only(top: Dimen.largeSpace),
                  child: Text(
                    'Majors',
                    style: CustomTextStyle.titleTextStyle(bold: true),
                  ),
                ),
                // * Major List
                Container(
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                  child: PagedListView<int, UniversityMajorModels>.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    pagingController: _universityMajorController,
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
                    builderDelegate: PagedChildBuilderDelegate<UniversityMajorModels>(
                      itemBuilder: (context, models, index) {
                        return ItemUniversityProgram(
                          onTap: () => _onShowMajorDetail(models.id),
                          imageUrl: models.majorImage,
                          title: models.majorName.name,
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                      noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Major found!')),
                      newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
                    ),
                  ),
                ),
                // * Specialize
                Text(
                  'Specialize',
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
                // * Specialize List
                Container(
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                  child: PagedListView<int, UniversitySpecializeModels>.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    pagingController: _universitySpecializeController,
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
                    builderDelegate: PagedChildBuilderDelegate<UniversitySpecializeModels>(
                      itemBuilder: (context, models, index) {
                        return ItemUniversityProgram(
                          onTap: () => _onShowSpecializeDetail(models.id),
                          imageUrl: models.specializeImage,
                          title: models.specializeName.name,
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                      noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Specialize found!')),
                      newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _buildAdmissionsTab {
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
                padding: const EdgeInsets.all(Dimen.contentPadding),
                child: Column(
                  children: [
                    // * Admissions
                    Container(
                      margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Admissions Overview',
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    Column(
                      children: [
                        _AdmissionBriefDetails(
                          title: 'Acceptance Number',
                          subtitle: '${_universityAdmissionModel!.averageStudentAcceptance.toString()} people',
                          icon: Assets.iconAcceptance,
                        ),
                        _AdmissionBriefDetails(
                          title: 'Regular Application Due',
                          subtitle: _universityAdmissionModel!.isActive == 1
                              ? _universityAdmissionModel!.applicationDeadline
                              : 'Closed',
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
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                      child: CustomHtmlWidget(
                        data: _universityAdmissionModel!.descriptionEn,
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
                          // * Address
                          _ContactItem(
                            icon: Icons.location_on_outlined,
                            title: Text(
                              _universityAdmissionModel!.contactInfo.address,
                              style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                          // * Phone Number
                          _ContactItem(
                            icon: Icons.phone_outlined,
                            title: Text.rich(
                              TextSpan(
                                text: _universityAdmissionModel!.contactInfo.primaryPhoneNumber,
                                style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => openURILauncher(
                                      launchURL:
                                          'tel:${_universityAdmissionModel!.contactInfo.primaryPhoneNumber}'),
                                children: [
                                  TextSpan(
                                    text: _universityAdmissionModel!.contactInfo.secondPhoneNumber != null
                                        ? '/${_universityAdmissionModel!.contactInfo.secondPhoneNumber}'
                                        : '',
                                    style: CustomTextStyle.bodyTextStyle(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => openURILauncher(
                                          launchURL:
                                              'tel:${_universityAdmissionModel!.contactInfo.secondPhoneNumber}'),
                                  ),
                                  TextSpan(
                                    text: _universityAdmissionModel!.contactInfo.thirdPhoneNumber != null
                                        ? '/${_universityAdmissionModel!.contactInfo.thirdPhoneNumber}'
                                        : '',
                                    style: CustomTextStyle.bodyTextStyle(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => openURILauncher(
                                          launchURL:
                                              'tel:${_universityAdmissionModel!.contactInfo.thirdPhoneNumber}'),
                                  ),
                                ],
                              ),
                            ),
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
                    const SizedBox(height: Dimen.largeSpace),
                    // * Download Admission
                    SizedBox(
                      height: 51,
                      child: ElevatedButton(
                        onPressed: _universityAdmissionModel!.admissionUrl == null
                            ? () => context.showInfoSnackBar(msg: 'No Admission URL found!')
                            : () {},
                        child: Text(
                          'Download Admission',
                          style: CustomTextStyle.buttonTextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget get _buildScholarshipsTab {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Scholarships List Success
        if (state is RequestUniversityScholarshipListSuccessState) {
          // * Set University Scholarships List
          _universityScholarshipController.itemList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Scholarships List Error
        if (state is RequestUniversityScholarshipListErrorState) {
          // * Return
          return;
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          // * Request University Scholarships List
          context.read<UniversityBloc>().add(RequestUniversityScholarshipListEvent(id: widget.universityId));
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              children: [
                const SizedBox(height: Dimen.largeSpace),
                // * Scholarship List
                PagedListView<int, UniversityScholarshipModels>.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  pagingController: _universityScholarshipController,
                  separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
                  builderDelegate: PagedChildBuilderDelegate<UniversityScholarshipModels>(
                    itemBuilder: (context, models, index) {
                      return ItemUniversityScholarship(
                        models: models,
                        onTap: () => _onShowScholarshipDetail(models.id),
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Scholarship found!')),
                    newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _buildEventTab {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Event List Success
        if (state is RequestUniversityEventListSuccessState) {
          // * Set University Event List
          _universityEventController.itemList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Event List Error
        if (state is RequestUniversityEventListErrorState) {
          // * Return
          return;
        }
      },
      child: PagedListView<int, UniversityEventModels>.separated(
        pagingController: _universityEventController,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Dimen.contentPadding),
        separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
        builderDelegate: PagedChildBuilderDelegate<UniversityEventModels>(
          itemBuilder: (context, models, index) {
            return ItemUniversityEvent(
              models: models,
              onTap: () => _onShowEventDetail(models.id),
            );
          },
          firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator()),
          noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Event found!')),
          newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget get _buildTuitionTab {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Tuition List Success
        if (state is RequestTuitionListSuccessState) {
          // * Set University Tuition List
          _universityTuitionController.itemList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Tuition List Error
        if (state is RequestTuitionListErrorState) {
          // * Return
          return;
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.contentPadding),
          child: Column(
            children: [
              // * Tuition
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Major & Specialize',
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
              ),
              const SizedBox(height: Dimen.extraLargeSpace),
              // * Tuition List
              PagedListView<int, UniversityTuitionModels>(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                pagingController: _universityTuitionController,
                builderDelegate: PagedChildBuilderDelegate<UniversityTuitionModels>(
                  itemBuilder: (context, models, index) {
                    return ItemUniversityTuition(models: models);
                  },
                  firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator()),
                  noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Tuition found!')),
                  newPageProgressIndicatorBuilder: (context) => const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildMajorDetail {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        if (state is RequestUniversityMajorDetailSuccessState) {
          // * Set University Major Detail Model
          _universityMajorDetailModel = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Major Detail
        if (state is RequestUniversityMajorDetailErrorState) {
          // * Return
          return;
        }
      },
      child: _universityMajorDetailModel != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // * Major Detail
                  CustomHtmlWidget(
                    data: _universityMajorDetailModel!.description,
                  ),
                  // * Download Curriculum Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimen.extraLargeSpace,
                        ),
                      ),
                      child: Text(
                        'Download Curriculum',
                        style: CustomTextStyle.buttonTextStyle(),
                      ),
                    ),
                  ),
                  // * More About Admission Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimen.extraLargeSpace,
                        ),
                      ),
                      child: Text(
                        'More About Admission',
                        style: CustomTextStyle.buttonTextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const ProgressBar(),
    );
  }

  Widget get _buildSpecializeDetail {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Specialize Detail
        if (state is RequestUniversitySpecializeDetailSuccessState) {
          // * Set University Major Detail Model
          _universitySpecializeDetailModel = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Specialize Detail
        if (state is RequestUniversitySpecializeDetailErrorState) {
          // * Return
          return;
        }
      },
      child: _universitySpecializeDetailModel != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // * Major Detail
                  CustomHtmlWidget(
                    data: _universitySpecializeDetailModel!.description,
                  ),
                  // * Download Curriculum Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimen.extraLargeSpace,
                        ),
                      ),
                      child: Text(
                        'Download Curriculum',
                        style: CustomTextStyle.buttonTextStyle(),
                      ),
                    ),
                  ),
                  // * More About Admission Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimen.extraLargeSpace,
                        ),
                      ),
                      child: Text(
                        'More About Admission',
                        style: CustomTextStyle.buttonTextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const ProgressBar(),
    );
  }

  Widget get _buildScholarshipDetail {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Scholarship Detail Success
        if (state is RequestUniversityScholarshipDetailSuccessState) {
          // * Set University Scholarship Detail Model
          _universityScholarshipDetailModel = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Scholarship Detail Error
        if (state is RequestUniversityScholarshipDetailErrorState) {
          // * Return
          return;
        }
      },
      child: _universityScholarshipDetailModel != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimen.contentPadding),
                child: Column(
                  children: [
                    // * Scholarship Cover Image
                    CustomCachedNetworkImage(
                      imageUrl: _universityScholarshipDetailModel!.image,
                      config: CustomCachedNetworkImageConfig(
                        width: double.infinity,
                        height: 160,
                        boxFit: BoxFit.contain,
                        backgroundColor: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                      ),
                    ),
                    // * Scholarship Title
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                      child: Text(
                        _universityScholarshipDetailModel!.name,
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                    ),
                    // * Scholarship Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _universityScholarshipDetailModel!.description,
                        style: CustomTextStyle.bodyTextStyle(),
                      ),
                    ),
                    // * Scholarship Detail
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                      child: CustomHtmlWidget(
                        data: _universityScholarshipDetailModel!.detailEn,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: CustomTextStyle.titleTextStyle(bold: true),
                        ),
                        const SizedBox(height: Dimen.largeSpace),
                        // *  Email
                        Container(
                          margin: const EdgeInsets.only(bottom: Dimen.smallSpace),
                          child: Text.rich(
                            TextSpan(
                              text: 'Email: ',
                              style: CustomTextStyle.bodyTextStyle(),
                              children: [
                                TextSpan(
                                  text: _universityScholarshipDetailModel!.contactInfo.email,
                                  style: CustomTextStyle.bodyTextStyle(decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => openURILauncher(
                                          launchURL:
                                              'mailto:${_universityScholarshipDetailModel!.contactInfo.email}',
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // * Phone Number
                        Container(
                          margin: const EdgeInsets.only(bottom: Dimen.smallSpace),
                          child: Text.rich(
                            TextSpan(
                              text: 'Phone Number: ',
                              style: CustomTextStyle.bodyTextStyle(),
                              children: [
                                TextSpan(
                                  text: _universityScholarshipDetailModel!.contactInfo.primaryPhoneNumber,
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                                TextSpan(
                                  text: _universityScholarshipDetailModel!.contactInfo.secondPhoneNumber != null
                                      ? '/${_universityScholarshipDetailModel!.contactInfo.secondPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                                TextSpan(
                                  text: _universityScholarshipDetailModel!.contactInfo.thirdPhoneNumber != null
                                      ? '/${_universityScholarshipDetailModel!.contactInfo.thirdPhoneNumber}'
                                      : '',
                                  style: CustomTextStyle.bodyTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // * Address
                        Text(
                          'Address: ${_universityScholarshipDetailModel!.contactInfo.address}',
                          style: CustomTextStyle.bodyTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : const ProgressBar(),
    );
  }

  Widget get _buildEventDetail {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University Event Detail Success
        if (state is RequestUniversityEventDetailSuccessState) {
          // * Set University Event Detail Model
          _universityEventDetailModel = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request University Event Detail Error
        if (state is RequestUniversityEventDetailErrorState) {
          // * Return
          return;
        }
      },
      child: _universityEventDetailModel != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimen.contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Event Title
                    Text(
                      _universityEventDetailModel!.name,
                      style: CustomTextStyle.titleTextStyle(bold: true),
                    ),
                    // * Event Date and Time
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultRadius),
                      child: Text(
                        '${DateFormat('d MMMM y').format(DateTime.parse(_universityEventDetailModel!.eventDate))} | ${_universityEventDetailModel!.startAt} to ${_universityEventDetailModel!.endAt}',
                        style: CustomTextStyle.bodyTextStyle(),
                      ),
                    ),
                    // * Event Category and Location
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: _universityEventDetailModel!.category.name,
                              style: CustomTextStyle.bodyTextStyle(bold: true),
                            ),
                            TextSpan(
                              text: ' - ${_universityEventDetailModel!.location}',
                              style: CustomTextStyle.bodyTextStyle(),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => openURILauncher(launchURL: _universityEventDetailModel!.locationLink),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // * Event Cover Image
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: CustomCachedNetworkImage(
                        imageUrl: _universityEventDetailModel!.thumbnailImage,
                        config: CustomCachedNetworkImageConfig(
                          width: double.infinity,
                          height: 400,
                          backgroundColor: primaryColor.withOpacity(0.2),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                        ),
                      ),
                    ),
                    // * Event Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
                      child: CustomHtmlWidget(
                        data: _universityEventDetailModel!.description,
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  void _onChangeDegreeLevel(int id) {
    setState(() {
      _selectedDegreeLevelId = id;
    });
    // * Request University Major List
    context.read<UniversityBloc>().add(RequestUniversityMajorListEvent(id: widget.universityId, degreeLevel: id));
    // * Request University Specialize List
    context
        .read<UniversityBloc>()
        .add(RequestUniversitySpecializeListEvent(id: widget.universityId, degreeLevel: id));
  }

  void _onShowMajorDetail(int id) {
    setState(() {
      _showMajorDetail = !_showMajorDetail;
    });
    context.read<UniversityBloc>().add(RequestUniversityMajorDetailEvent(id: id));
  }

  void _onShowSpecializeDetail(int id) {
    setState(() {
      _showSpecializeDetail = !_showSpecializeDetail;
    });
    context.read<UniversityBloc>().add(RequestUniversitySpecializeDetailEvent(id: id));
  }

  void _onShowScholarshipDetail(int id) {
    setState(() {
      _showScholarshipDetail = !_showScholarshipDetail;
    });
    context.read<UniversityBloc>().add(RequestUniversityScholarshipDetailEvent(id: id));
  }

  void _onShowEventDetail(int id) {
    setState(() {
      _showEventDetail = !_showEventDetail;
    });
    context.read<UniversityBloc>().add(RequestUniversityEventDetailEvent(id: id));
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

class _DegreeLevelsMenu extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const _DegreeLevelsMenu({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.defaultSpace, vertical: Dimen.mediumSpace),
      backgroundColor: Colors.white,
      showCheckmark: false,
      selectedColor: Colors.white,
      disabledColor: Colors.white,
      onSelected: onSelected,
      label: Text(label, style: CustomTextStyle.bodyTextStyle(color: isSelected ? primaryColor : Colors.black)),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        side: BorderSide(color: isSelected ? primaryColor : Colors.black),
      ),
    );
  }
}
