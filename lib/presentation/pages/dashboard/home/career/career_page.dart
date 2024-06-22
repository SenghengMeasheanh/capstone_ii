import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  // * Pagination
  final _pagingController = PagingController<int, CareerModels>(firstPageKey: 1);
  final _paginationRequest = PaginationRequest();
  // * Controller
  final _searchBarController = TextEditingController();

  // * Debouncer
  final _debouncer = Debouncer(milliseconds: 500);

  // * Models
  var _careerTypeList = <CareerTypeModels>[];

  // * Varaible
  var _selectedCareerType = 0;

  @override
  void initState() {
    super.initState();

    // * Pagination
    _pagingController.addPageRequestListener((pageKey) {
      // * Init Pagination Request
      _paginationRequest.page = pageKey;
      _paginationRequest.limit = 10;
      // * Request Career List
      context.read<CareerBloc>().add(RequestCareerListEvent(paginationRequest: _paginationRequest));
    });

    // * Request Career Type List
    context.read<CareerBloc>().add(RequestCareerTypeListEvent());
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    _pagingController.dispose();
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
      body: BlocListener<CareerBloc, CareerState>(
        listener: (context, state) {
          // * Request Career List Success State
          if (state is RequestCareerListSuccessState) {
            // * Init Pagination
            pagination(
              list: state.response.body.data,
              page: _paginationRequest.page!,
              pagingController: _pagingController,
            );
            // * Return
            return;
          }
          // * Request Career Type List Success State
          if (state is RequestCareerTypeListSuccessState) {
            // * Set Career Type List
            _careerTypeList = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Career List Error State
          if (state is RequestCareerListErrorState) {
            // * Return
            return;
          }
          // ! Request Career Type List Error State
          if (state is RequestCareerTypeListErrorState) {
            // * Return
            return;
          }
        },
        child: RefreshIndicator(
          onRefresh: () async => {
            _pagingController.refresh(),
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Title
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                    child: Text(
                      'Career',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  // * Searchbar
                  SearchBarWidget(
                    controller: _searchBarController,
                    onChange: _onSearchCareer,
                  ),
                  // * Subitlet
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Text(
                      'Find a career that works \n for you',
                      style: CustomTextStyle.largeTitleTextStyle(fontSize: Dimen.titleTextSize + 8, bold: true),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // * Filter Description
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: Text(
                      'Filter by job category',
                      style: CustomTextStyle.bodyTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // * Filter Menu
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                    child: Wrap(
                      spacing: 10,
                      children: _careerTypeList
                          .map(
                            (e) => _CareerType(
                              label: e.name,
                              isSelected: _selectedCareerType == e.id,
                              onSelected: (value) => _onFilterCareerType(e.id),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  // * Career List
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: PagedListView.separated(
                      pagingController: _pagingController,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builderDelegate: PagedChildBuilderDelegate<CareerModels>(
                        itemBuilder: (context, models, index) => ItemCareer(
                          onTap: () => context.push(destination: const CareerDetailPage()),
                          models: models,
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (context) => const EmptyItems(),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.extraLargeSpace + 5),
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

  void _onSearchCareer(String value) {
    // * Init Search
    _paginationRequest.search = value;
    // * Debounce
    _debouncer.run(() {
      // * Reset Pagination
      _pagingController.refresh();
    });
  }

  void _onFilterCareerType(int id) {
    // * Set Selected Career Type
    setState(() {
      _selectedCareerType = id;
    });
    // * Init Filter
    _paginationRequest.type = id;
    // * Reset Pagination
    _pagingController.refresh();
  }
}

class _CareerType extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;
  const _CareerType({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: Colors.white,
      showCheckmark: false,
      selectedColor: primaryColor,
      disabledColor: Colors.white,
      onSelected: onSelected,
      label: Text(label, style: CustomTextStyle.bodyTextStyle(color: isSelected ? Colors.white : primaryColor)),
      selected: isSelected,
      side: const BorderSide(color: primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: Dimen.defaultSpace, vertical: Dimen.mediumSpace),
    );
  }
}
