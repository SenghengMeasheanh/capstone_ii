import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScholarshipsDetailPage extends StatefulWidget {
  final int id;

  const ScholarshipsDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<ScholarshipsDetailPage> createState() => _ScholarshipsDetailPageState();
}

class _ScholarshipsDetailPageState extends State<ScholarshipsDetailPage> {
  // * Model
  ScholarshipDetailModels? _models;

  @override
  void initState() {
    super.initState();
    // * Request Scholarship Detail
    context.read<ScholarshipBloc>().add(RequestScholarshipDetailEvent(id: widget.id));
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
          // * Request Scholarship Detail Success
          if (state is RequestScholarshipDetailSuccessState) {
            // * Set Scholarship Detail
            _models = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Scholarship Detail Error
          if (state is RequestScholarshipDetailErrorState) {
            // * Return
            return;
          }
        },
        child: _models != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                    Dimen.contentPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Scholarship Title
                      Text(
                        _models!.name,
                        style: CustomTextStyle.largeTitleTextStyle(bold: true),
                      ),
                      // * Cover Image
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.largeSpace),
                        child: CustomCachedNetworkImage(
                          imageUrl: _models!.image,
                          config: CustomCachedNetworkImageConfig(
                            height: 250,
                            width: double.infinity,
                            boxFit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      // * Scholarship Title
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                        child: Text(
                          _models!.name,
                          style: CustomTextStyle.titleTextStyle(bold: true),
                        ),
                      ),
                      // * Scholarship Description
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _models!.description,
                          style: CustomTextStyle.bodyTextStyle(),
                        ),
                      ),
                      // * Scholarship Detail
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                        child: CustomHtmlWidget(
                          data: _models!.detail,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Information',
                              style: CustomTextStyle.titleTextStyle(bold: true),
                            ),
                            const SizedBox(height: Dimen.largeSpace),
                            // *  Email
                            Container(
                              margin: const EdgeInsets.only(bottom: Dimen.smallSpace),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Email: ',
                                  style: CustomTextStyle.bodyTextStyle(),
                                  children: [
                                    TextSpan(
                                      text: _models!.contactInfo.email,
                                      style: CustomTextStyle.bodyTextStyle(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openURILauncher(
                                              launchURL: 'mailto:${_models!.contactInfo.email}',
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // * Phone Number
                            Container(
                              margin: const EdgeInsets.only(bottom: Dimen.smallSpace),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Phone Number: ',
                                  style: CustomTextStyle.bodyTextStyle(),
                                  children: [
                                    TextSpan(
                                      text: _models!.contactInfo.primaryPhoneNumber,
                                      style: CustomTextStyle.bodyTextStyle(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openURILauncher(
                                              launchURL: 'tel:${_models!.contactInfo.primaryPhoneNumber}',
                                            ),
                                    ),
                                    TextSpan(
                                      text: _models!.contactInfo.secondPhoneNumber != null
                                          ? '/${_models!.contactInfo.secondPhoneNumber}'
                                          : '',
                                      style: CustomTextStyle.bodyTextStyle(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openURILauncher(
                                              launchURL: 'tel:${_models!.contactInfo.secondPhoneNumber}',
                                            ),
                                    ),
                                    TextSpan(
                                      text: _models!.contactInfo.thirdPhoneNumber != null
                                          ? '/${_models!.contactInfo.thirdPhoneNumber}'
                                          : '',
                                      style: CustomTextStyle.bodyTextStyle(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => openURILauncher(
                                              launchURL: 'tel:${_models!.contactInfo.thirdPhoneNumber}',
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // * Address
                            Text.rich(
                              TextSpan(
                                text: 'Address: ',
                                style: CustomTextStyle.bodyTextStyle(),
                                children: [
                                  TextSpan(
                                    text: _models!.contactInfo.address,
                                    style: CustomTextStyle.bodyTextStyle(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => openURILauncher(
                                            launchURL: _models!.contactInfo.address,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const ProgressBar(),
      ),
    );
  }
}
