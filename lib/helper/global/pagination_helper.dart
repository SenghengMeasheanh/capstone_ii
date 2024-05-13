import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:capstone_ii/helper/helper_export.dart';

void pagination({
  required List list,
  required int page,
  required PagingController pagingController,
}) {
  // * Init Last Page
  final isLastPage = list.length < pageSize;
  // * If Last Page
  if (isLastPage) {
    // * Append Last Page
    pagingController.appendLastPage(list);
    // * Return
    return;
  }
  // * Init Next Page
  final nextPageKey = page += 1;
  // * Append Page
  pagingController.appendPage(list, nextPageKey);
}
