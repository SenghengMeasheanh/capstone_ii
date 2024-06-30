import 'package:capstone_ii/data/data_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FinancialAidPage extends StatefulWidget {
  const FinancialAidPage({super.key});

  @override
  State<FinancialAidPage> createState() => _FinancialAidPageState();
}

class _FinancialAidPageState extends State<FinancialAidPage> {
  // * Paging Controller
  final _pagingController = PagingController<int, FinancialAidModels>(firstPageKey: 1);
  final _paginationRequest = PaginationRequest();
  // * Text Controller
  final _searchBarController = TextEditingController();
  // * Debouncer
  final _debouncer = Debouncer(milliseconds: 800);

  @override
  void initState() {
    // * Request Financial Aid List
    _pagingController.addPageRequestListener((pageKey) {
      // * Set Page and Limit
      _paginationRequest.page = pageKey;
      _paginationRequest.limit = 10;
      context.read<FinancialAidBloc>().add(RequestFinancialAidListEvent(paginationRequest: _paginationRequest));
    });
    super.initState();
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
      body: BlocListener<FinancialAidBloc, FinancialAidState>(
        listener: (context, state) {
          // * Request Financial Aid List Success
          if (state is RequestFinancialAidListSuccessState) {
            // * Init Pagination
            pagination(
              list: state.response.body.data,
              page: _paginationRequest.page!,
              pagingController: _pagingController,
            );
            // * Return
            return;
          }
          // ! Request Financial Aid List Error
          if (state is RequestFinancialAidListErrorState) {
            // * Return
            return;
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // * Title
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                    child: Text(
                      'Financial Aid',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  // * Searchbar
                  SearchBarWidget(
                    controller: _searchBarController,
                    onChange: (value) => _debouncer.run(() => _searchFinancialAid(value)),
                  ),
                  const SizedBox(height: Dimen.mediumSpace),
                  // * Financial Aid List
                  Center(
                    child: PagedListView<int, FinancialAidModels>.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      pagingController: _pagingController,
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.largeSpace),
                      builderDelegate: PagedChildBuilderDelegate<FinancialAidModels>(
                        itemBuilder: (context, models, index) {
                          return ItemFinancialAid(
                            models: models,
                            onTap: () => context.push(destination: FinancialAidDetailPage(id: models.id)),
                          );
                        },
                        firstPageProgressIndicatorBuilder: (context) => const ProgressBar(),
                        newPageProgressIndicatorBuilder: (context) => const ProgressBar(),
                        noItemsFoundIndicatorBuilder: (context) => const EmptyItems(),
                      ),
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

  void _searchFinancialAid(String value) {
    // * Set Search
    _paginationRequest.search = value;
    // * Refresh
    _pagingController.refresh();
  }
}
