import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ScholarshipsPage extends StatefulWidget {
  const ScholarshipsPage({super.key});

  @override
  State<ScholarshipsPage> createState() => _ScholarshipsPageState();
}

class _ScholarshipsPageState extends State<ScholarshipsPage> {
  // * Paging Controller
  final _pagingController = PagingController<int, ScholarshipModels>(firstPageKey: 1);
  final _paginationRequest = PaginationRequest();

  // * Controller for search bar
  final _searchBarController = TextEditingController();

  // * Debouncer
  final _debouncer = Debouncer(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    //* Request Scholarship List
    _pagingController.addPageRequestListener(
      (pageKey) {
        // * Init Pagination
        _paginationRequest.page = pageKey;
        _paginationRequest.limit = 10;
        // * Request Scholarship List
        context.read<ScholarshipBloc>().add(RequestScholarshipListEvent(paginationRequest: _paginationRequest));
      },
    );
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
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<ScholarshipBloc, ScholarshipState>(
        listener: (context, state) {
          // * Request Scholarship List Success
          if (state is RequestScholarshipListSuccessState) {
            // * Init Pagination
            pagination(
              list: state.response.body.data,
              page: _paginationRequest.page!,
              pagingController: _pagingController,
            );
            // * Return
            return;
          }
          // ! Request Scholarship List Error
          if (state is RequestScholarshipListErrorState) {
            // * Return
            return;
          }
        },
        child: RefreshIndicator(
          onRefresh: () async => _pagingController.refresh(),
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
                      'Scholarships',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  // * Searchbar
                  SearchBarWidget(
                    controller: _searchBarController,
                    onChange: (value) => _debouncer.run(() => _onSearchScholarship(value)),
                  ),
                  // * Scholarship List
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: PagedListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<ScholarshipModels>(
                        itemBuilder: (context, models, index) {
                          return ItemScholarship(
                            models: models,
                            onTap: () {},
                          );
                        },
                        firstPageProgressIndicatorBuilder: (context) => const ProgressBar(),
                        newPageProgressIndicatorBuilder: (context) => const ProgressBar(),
                        noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
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

  void _onSearchScholarship(String value) {
    // * Init Pagination
    _paginationRequest.search = value;
    // * Request Scholarship List
    _pagingController.refresh();
  }
}
