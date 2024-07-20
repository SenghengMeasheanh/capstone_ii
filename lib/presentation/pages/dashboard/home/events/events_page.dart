import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
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

  @override
  void initState() {
    super.initState();
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
          // ! Request Event List Error
          if (state is RequestEventsListErrorState) {
            // * Return
            return;
          }
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
                    'Events',
                    style: CustomTextStyle.largeTitleTextStyle(bold: true),
                  ),
                ),
                //  * Searchbar
                SearchBarWidget(
                  controller: _searchBarController,
                  onChange: (value) => {},
                ),
                // * Filter Menu
                Container(
                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      const ChoiceChip(
                        labelStyle: TextStyle(color: Colors.white),
                        label: Text('All Events'),
                        selected: true,
                        selectedColor: primaryColor,
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: Dimen.largeSpace,
                          vertical: Dimen.smallSpace,
                        ),
                      ),
                      ChoiceChip(
                        label: Text(
                          'Workshops',
                          style: CustomTextStyle.captionTextStyle(
                            color: primaryColor,
                            bold: true,
                          ),
                        ),
                        disabledColor: Colors.white,
                        side: const BorderSide(color: primaryColor),
                        selected: false,
                      ),
                      ChoiceChip(
                        label: Text(
                          'Meetups',
                          style: CustomTextStyle.captionTextStyle(
                            color: primaryColor,
                            bold: true,
                          ),
                        ),
                        disabledColor: Colors.white,
                        side: const BorderSide(color: primaryColor),
                        selected: false,
                      ),
                    ],
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
                      itemBuilder: (context, models, index) => ItemEvent(models: models, onTap: () {}),
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
}
