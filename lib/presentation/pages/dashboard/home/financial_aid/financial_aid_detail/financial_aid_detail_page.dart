import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialAidDetailPage extends StatefulWidget {
  final int id;
  const FinancialAidDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<FinancialAidDetailPage> createState() => _FinancialAidDetailPageState();
}

class _FinancialAidDetailPageState extends State<FinancialAidDetailPage> {
  // * Models
  FinancialAidDetailModels? _models;
  var _moreArticlesModels = <FinancialAidModels>[];

  // * Init State
  @override
  void initState() {
    super.initState();
    // * Request Financial Aid Detail
    context.read<FinancialAidBloc>().add(RequestFinancialAidDetailEvent(id: widget.id));
    // * Request Financial Aid More Articles List
    context.read<FinancialAidBloc>().add(RequestFinancialAidMoreArticlesListEvent(id: widget.id));
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
          // * Request Financial Aid Detail Success
          if (state is RequestFinancialAidDetailSuccessState) {
            // * Set Models
            _models = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // * Request Financial Aid More Articles List Success
          if (state is RequestFinancialAidMoreArticlesListSuccessState) {
            // * Set More Articles Models
            _moreArticlesModels = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Financial Aid Detail Error
          if (state is RequestFinancialAidDetailErrorState) {
            // * Return
            return;
          }
          // ! Request Financial Aid More Articles List Error
          if (state is RequestFinancialAidMoreArticlesListErrorState) {
            // * Return
            return;
          }
        },
        child: _models != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(Dimen.contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _models!.name,
                      style: CustomTextStyle.titleTextStyle(bold: true, fontSize: Dimen.midTitleTextSize),
                    ),
                    // * Cover Image
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      height: 197,
                      child: CustomCachedNetworkImage(
                        imageUrl: _models!.image,
                        config: CustomCachedNetworkImageConfig(
                          width: double.infinity,
                          height: double.infinity,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // * Short Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: Text(
                        _models!.shortDescription,
                        style: CustomTextStyle.bodyTextStyle(),
                      ),
                    ),
                    // * Description
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: CustomHtmlWidget(
                        data: _models!.detailDescription,
                      ),
                    ),
                    // * Divider
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                    // * Post Date
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.largeSpace),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'POSTED ON: ',
                              style: CustomTextStyle.bodyTextStyle(bold: true),
                            ),
                            TextSpan(
                              text: '${_models!.publishAt} updated -${_models!.updateAt}',
                              style: CustomTextStyle.bodyTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* More Articles List
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.extraLargeSpace * 2),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _moreArticlesModels.length,
                        separatorBuilder: (context, index) => const SizedBox(height: Dimen.defaultSpace * 2),
                        itemBuilder: (context, index) {
                          return ItemMoreArticles(
                            title: _moreArticlesModels[index].name,
                            subtitle: _moreArticlesModels[index].shortDescription,
                            imageUrl: _moreArticlesModels[index].image,
                            onTap: () => context.push(
                              destination: FinancialAidDetailPage(id: _moreArticlesModels[index].id),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
