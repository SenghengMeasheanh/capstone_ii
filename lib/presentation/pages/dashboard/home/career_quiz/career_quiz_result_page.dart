import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';

class CareerQuizResultPage extends StatefulWidget {
  final List<CareerQuizResultModels> models;
  const CareerQuizResultPage({
    super.key,
    required this.models,
  });

  @override
  State<CareerQuizResultPage> createState() => _CareerQuizResultPageState();
}

class _CareerQuizResultPageState extends State<CareerQuizResultPage> {
  // * Paging Controller
  final _pagingController = PagingController<int, CareerQuizResultModels>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.itemList = widget.models;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.contentPadding),
          child: Column(
            children: [
              // * Title
              Container(
                alignment: Alignment.center,
                child: Text(
                  tr(LocaleKeys.your_result),
                  style: CustomTextStyle.titleTextStyle(bold: true),
                ),
              ),
              // * Description
              Container(
                margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                alignment: Alignment.center,
                child: Text(
                  tr(LocaleKeys.careers_that_match_your_area_of_interest),
                  style: CustomTextStyle.titleTextStyle(),
                ),
              ),
              // * Result List
              Container(
                margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                child: PagedListView(
                  pagingController: _pagingController,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  builderDelegate: PagedChildBuilderDelegate<CareerQuizResultModels>(
                    itemBuilder: (context, models, index) {
                      return ItemCareerQuizResult(
                        models: models,
                        number: index + 1,
                        onTap: () => context.push(destination: CareerDetailPage(id: models.id)),
                      );
                    },
                    firstPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
                    newPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
