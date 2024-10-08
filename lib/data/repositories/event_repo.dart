import 'package:capstone_ii/data/data_export.dart';

class EventRepo {
  Future<ListBodyResponse<EventModels>> getEventList({
    String? search,
    int? page,
    int? limit,
    int? category,
  }) async {
    return await ApiService().getEventList(
      search: search,
      page: page,
      limit: limit,
      category: category,
    );
  }

  Future<ListBodyResponse<EventCategoryModels>> getEventCategoryList(){
    return ApiService().getEventCategoryList();
  }

  Future<MapBodyResponse<EventDetailModels>> getEventDetail({
    required int id,
  }) async {
    return await ApiService().getEventDetail(id: id);
  }
}
