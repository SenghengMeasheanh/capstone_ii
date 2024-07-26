import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // * Paging Controller
  final _pagingController = PagingController<int, EventModels>(firstPageKey: 1);
  final _paginationRequest = PaginationRequest();
  // * Controller
  final _searchBarController = TextEditingController();
  // * Debouncer
  final _debouncer = Debouncer(milliseconds: 800);
  // *  Model
  var _eventCategoryModels = <EventCategoryModels>[];

  // * Varaible
  var _selectedEventCategory = 0;

  @override
  void initState() {
    super.initState();
    // * Request Event Category List
    context.read<EventsBloc>().add(RequestEventsCategoryListEvent());
    // * Paging Controller
    _pagingController.addPageRequestListener((pageKey) {
      // * Init Pagination Request
      _paginationRequest.page = pageKey;
      _paginationRequest.limit = 10;
      // *  Request Events List
      context.read<EventsBloc>().add(RequestEventsListEvent(paginationRequest: _paginationRequest));
    });
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
      body: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {
          // * Request Event List Success
          if (state is RequestEventsListSuceesState) {
            // * Init Pagination
            pagination(
              list: state.response.body.data,
              page: _paginationRequest.page!,
              pagingController: _pagingController,
            );
            // * Return
            return;
          }
          // * Request Event Category List Success
          if (state is RequestEventsCategoryListSuccessState) {
            // * Set Event Category Models
            _eventCategoryModels = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Event List Error
          if (state is RequestEventsListErrorState) {
            // * Return
            return;
          }
          // ! Request Event Category List Error
          if (state is RequestEventsCategoryListErrorState) {
            // * Return
            return;
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            // * Reset Pagination
            _paginationRequest.category = null;
            setState(() {
              _selectedEventCategory = 0;
              _searchBarController.clear();
            });
            _pagingController.refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Title
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
                    child: Text(
                      tr(LocaleKeys.events),
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  //  * Searchbar
                  SearchBarWidget(
                    controller: _searchBarController,
                    onChange: (value) => _onSearchEvents(value),
                  ),
                  // * Filter Menu
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                    child: Wrap(
                      spacing: 10,
                      children: _eventCategoryModels
                          .map(
                            (e) => _EventCategory(
                              label: e.name,
                              isSelected: _selectedEventCategory == e.id,
                              onSelected: (value) => _onFilterEventCategory(e.id),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  // * Event List
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: PagedListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(height: Dimen.mediumSpace),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<EventModels>(
                        itemBuilder: (context, models, index) => ItemEvent(
                          models: models,
                          onTap: () => context.push(
                            destination: EventDetailPage(id: models.id),
                          ),
                        ),
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

  void _onSearchEvents(String value) {
    // * Init Search
    _paginationRequest.search = value;
    // * Debounce
    _debouncer.run(() {
      // * Reset Pagination
      _pagingController.refresh();
    });
  }

  void _onFilterEventCategory(int id) {
    // * Set Selected Career Type
    setState(() {
      _selectedEventCategory = id;
    });
    // * Init Filter
    _paginationRequest.category = id;
    // * Reset Pagination
    _pagingController.refresh();
  }
}

class _EventCategory extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;
  const _EventCategory({
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
