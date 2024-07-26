import 'package:capstone_ii/data/data_export.dart';

class SettingRepo {
  Future<ListBodyResponse<StaticPagesModels>> getStaticPages({
    String? alias,
  }) async {
    return await ApiService().getStaticPagesList(alias: alias);
  }
}
