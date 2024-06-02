import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UniversityFilterDialog with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
    required UniversityFilterMenu universityFilterMenu,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showDialog<T>(
      context: context ?? getCurrentContext,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (_) => _UniversityFilterDialog(
        universityFilterMenu: universityFilterMenu,
      ),
    ).then((result) {
      // * Set [isShowing] False
      _isShowing = false;
      // * Return Result
      return result;
    });
  }

  // * Get Dialog Showing
  bool get isShowing => _isShowing;
}

class _UniversityFilterDialog extends StatefulWidget {
  final UniversityFilterMenu universityFilterMenu;
  const _UniversityFilterDialog({required this.universityFilterMenu});

  @override
  State<_UniversityFilterDialog> createState() => _UniversityFilterDialogState();
}

class _UniversityFilterDialogState extends State<_UniversityFilterDialog> with ModalUtilsMixin {
  // *  PagingController
  final _pagingController = PagingController<int, dynamic>(firstPageKey: 1);

  // * Text Controller
  final _searchBarController = TextEditingController();

  // * Duplicate List
  List<dynamic> _duplicateList = [];

  @override
  void initState() {
    super.initState();
    context.read<UniversityBloc>().add(_event);
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _searchBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Dialog.fullscreen(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Title and Close Button
              Container(
                margin: EdgeInsets.only(bottom: Dimen.mediumSpace.h, top: Dimen.defaultSpace.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Expanded(
                      child: Center(
                        child: Text(
                          getUniversityFilterMenuTitle(value: widget.universityFilterMenu),
                          style: CustomTextStyle.titleTextStyle(
                            fontSize: Dimen.midTitleTextSize,
                            bold: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () => dismiss(context: context),
                        icon: SvgPicture.asset(
                          Assets.iconClose,
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // * Divider
              const Divider(
                color: Colors.black,
              ),
              SizedBox(height: Dimen.defaultSpace.h * 2),
              // * Search Bar
              Container(
                margin: EdgeInsets.only(bottom: Dimen.defaultSpace.h * 2),
                child: SearchBarWidget(
                  controller: _searchBarController,
                  onChange: _onSearchFilterItem,
                ),
              ),
              // * Divider
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: Dimen.smallSpace),
              // * Filter List
              Expanded(
                child: _buildListWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildListWidget {
    return BlocListener<UniversityBloc, UniversityState>(
      listener: (context, state) {
        // * Request Degree List
        if (state is RequestDegreeListSuccessState) {
          // * Set Degree List
          _pagingController.itemList = state.response.body.data;
          // * Duplicate List
          _duplicateList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // * Request Location List
        if (state is RequestLocationListSuccessState) {
          // * Set Location List
          _pagingController.itemList = state.response.body.data;
          // * Duplicate List
          _duplicateList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // * Request Major List
        if (state is RequestMajorListSuccessState) {
          // * Set Major List
          _pagingController.itemList = state.response.body.data;
          // * Duplicate List
          _duplicateList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // * Request Type List
        if (state is RequestTypeListSuccessState) {
          // * Set Type List
          _pagingController.itemList = state.response.body.data;
          // * Duplicate List
          _duplicateList = state.response.body.data;
          // * Notify
          setState(() {});
          // * Return
          return;
        }
        // ! Request Degree List
        if (state is RequestDegreeListErrorState) {
          // * Return
          return;
        }
        // ! Request Location List
        if (state is RequestLocationListErrorState) {
          // * Return
          return;
        }
        // ! Request Major List
        if (state is RequestMajorListErrorState) {
          // * Return
          return;
        }
        // ! Request Type List
        if (state is RequestTypeListErrorState) {
          // * Return
          return;
        }
      },
      child: PagedListView<int, dynamic>(
        shrinkWrap: true,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, models, index) {
            return ItemFilter(
              title: models.nameEn ?? '',
              onTap: () => dismiss(context: context, result: models.id),
            );
          },
          newPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
          noItemsFoundIndicatorBuilder: (_) => const Center(
            child: EmptyItems(),
          ),
        ),
      ),
    );
  }

  void _onSearchFilterItem(String value) {
    // * Filter List
    final filteredList = _duplicateList.where((element) {
      return element.nameEn!.toLowerCase().contains(value.toLowerCase());
    }).toList();
    // * Set Filtered List
    _pagingController.itemList = filteredList;
    // * Notify
    setState(() {});
  }

  UniversityEvent get _event {
    switch (widget.universityFilterMenu) {
      case UniversityFilterMenu.degree:
        return RequestDegreeListEvent();
      case UniversityFilterMenu.location:
        return RequestLocationListEvent();
      case UniversityFilterMenu.major:
        return RequestMajorListEvent();
      case UniversityFilterMenu.type:
        return RequestTypesListEvent();
      default:
        return RequestDegreeListEvent();
    }
  }
}
