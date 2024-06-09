import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  // * Pagination
  final _paginationRequest = PaginationRequest();
  final _pagingController = PagingController<int, UniversityModels>(firstPageKey: 1);

  // * Text Controller
  final _searchBarController = TextEditingController();

  // * Debouncer
  final _debouncer = Debouncer(milliseconds: 800);

  // * Variables
  var _resultCounter = 0;
  UniversityFilterMenu? _selectedFilterMenu;

  @override
  void initState() {
    super.initState();
    // * Pagination Controller
    _pagingController.addPageRequestListener((pageKey) {
      // * Init Pagination Request
      _paginationRequest.page = pageKey;
      _paginationRequest.limit = 11;
      // * Request University List
      context.read<UniversityBloc>().add(RequestUniversityListEvent(paginationRequest: _paginationRequest));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _searchBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request University List Success
        if (state is RequestUniversityListSuccessState) {
          // * Init Pagination
          pagination(
            list: state.response.body.data,
            page: _paginationRequest.page!,
            pagingController: _pagingController,
          );

          // * Get Result Counter
          _resultCounter = state.response.body.paginate!.total;
          // * Notify
          setState(() {});

          // * Return
          return;
        }
        // ! Request University List Error
        if (state is RequestUniversityListErrorState) {
          // * Return
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: Dimen.extraLargeSpace, left: Dimen.contentPadding, right: Dimen.contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Title
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                    child: Text(
                      'University',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  // * Search Bar
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimen.largeSpace),
                    child: SearchBarWidget(
                      controller: _searchBarController,
                      onChange: (v) => _debouncer.run(() => _onSearchUniversity(v)),
                    ),
                  ),

                  // * Filter Menu
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   crossAxisSpacing: Dimen.mediumSpace,
                  //   mainAxisSpacing: Dimen.mediumSpace,
                  //   childAspectRatio: 2.5,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   children: UniversityFilterMenu.values
                  //       .map(
                  //         (e) => ItemUniversityFilter(
                  //           onDeleteTap: () => {},
                  //           isSelected: false,
                  //           title: getUniversityFilterMenuTitle(value: e),
                  //           onTap: () => _onSelectFilterMenuTap(e),
                  //         ),
                  //       )
                  //       .toList(),
                  // ),

                  Wrap(
                    runSpacing: Dimen.mediumSpace,
                    spacing: Dimen.mediumSpace,
                    children: UniversityFilterMenu.values
                        .map(
                          (e) => ItemUniversityFilter(
                            onDeleteTap: _onDeleteFilter,
                            isSelected: _selectedFilterMenu == e,
                            title: getUniversityFilterMenuTitle(value: e),
                            onTap: () => _onSelectFilterMenuTap(e),
                          ),
                        )
                        .toList(),
                  ),
                  // * Description Title
                  Container(
                    margin: EdgeInsets.only(top: Dimen.extraLargeSpace.h),
                    child: Text(
                      'Find the right colleges for you',
                      style: CustomTextStyle.titleTextStyle(bold: true),
                    ),
                  ),
                  // * Description Text
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.mediumSpace, bottom: Dimen.extraLargeSpace),
                    child: Text(
                      'Use the filters above to narrow your search to schools that are a good fit for you.',
                      style: CustomTextStyle.bodyTextStyle(),
                    ),
                  ),
                  // * Result and Filter
                  Row(
                    children: [
                      // * Result
                      Text('$_resultCounter Results', style: CustomTextStyle.titleTextStyle(bold: true)),
                      const Spacer(),
                      // * Sort by
                      Text('Sort by', style: CustomTextStyle.bodyTextStyle()),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  const SizedBox(height: Dimen.extraLargeSpace),
                  // * University List
                  PagedListView<int, UniversityModels>.separated(
                    shrinkWrap: true,
                    primary: false,
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.defaultSpace),
                    builderDelegate: PagedChildBuilderDelegate(
                      animateTransitions: true,
                      itemBuilder: (context, models, item) => ItemUniversity( 
                        onTap: () => context.push(destination: UniversityDetailPage(universityId: models.id, coverImageUrl: models.image, logoImageUrl: models.logoImage,universityModels: models),),
                        models: models,
                      ),
                      firstPageProgressIndicatorBuilder: (_) {
                        return const Center(child: ProgressBar());
                      },
                      newPageProgressIndicatorBuilder: (_) {
                        return const Center(child: ProgressBar());
                      },
                      noItemsFoundIndicatorBuilder: (_) {
                        return const Center(child: EmptyItems());
                      },
                      noMoreItemsIndicatorBuilder: (_) => const Center(child: Text('No More Items')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSelectFilterMenuTap(UniversityFilterMenu universityFilterMenu) async {
    // * Await Select Filter Menu
    final result =
        await UniversityFilterDialog().show(context: context, universityFilterMenu: universityFilterMenu);

    // * Check Result
    if (result != null) {
      setState(() {
        _selectedFilterMenu = universityFilterMenu;
      });

      if (result is DegreeModels) {
        // * Init Degree
        _paginationRequest.degree = result.id;

        _pagingController.refresh();
      } else if (result is LocationModels) {
        // * Init Location
        _paginationRequest.location = result.id;

        _pagingController.refresh();
      } else if (result is MajorModels) {
        // * Init Major
        _paginationRequest.major = result.id;

        _pagingController.refresh();
      } else if (result is TypeModels) {
        // * Init Types
        _paginationRequest.type = result.id;

        _pagingController.refresh();
      } else {
        // * Init Filter
        _paginationRequest.degree = null;
        _paginationRequest.location = null;
        _paginationRequest.major = null;
        _paginationRequest.type = null;
      }
    }
  }

  void _onDeleteFilter() {
    // * Init Filter
    _paginationRequest.degree = null;
    _paginationRequest.location = null;
    _paginationRequest.major = null;
    _paginationRequest.type = null;
    // * Set Filter Select
    setState(() {
      _selectedFilterMenu = null;
    });
    // * Refresh
    _pagingController.refresh();
  }

  void _onSearchUniversity(String value) {
    // * Init Pagination Request
    _paginationRequest.search = value;
    // * Init Search University List
    _pagingController.refresh();
  }
}
