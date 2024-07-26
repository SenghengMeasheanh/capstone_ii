import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailPage extends StatefulWidget {
  final int id;
  const EventDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  // * Models
  EventDetailModels? _eventDetailModels;

  @override
  void initState() {
    super.initState();
    // * Request Event Detail
    context.read<EventsBloc>().add(RequestEventDetailEvent(id: widget.id));
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
          // * Request Event Detail Success
          if (state is RequestEventDetailSuccessState) {
            // * Set Event Detail
            _eventDetailModels = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Event Detail Error
          if (state is RequestEventDetailErrorState) {
            // * Return
            return;
          }
        },
        child: _eventDetailModels != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.contentPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Event Title
                      Text(
                        _eventDetailModels!.name,
                        style: CustomTextStyle.titleTextStyle(bold: true),
                      ),
                      // * Event Date and Time
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.defaultRadius),
                        child: Text(
                          '${DateFormat('d MMMM y').format(DateTime.parse(_eventDetailModels!.eventDate))} | ${_eventDetailModels!.startAt} to ${_eventDetailModels!.endAt}',
                          style: CustomTextStyle.bodyTextStyle(),
                        ),
                      ),
                      // * Event Category and Location
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.extraLargeSpace + 5),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: _eventDetailModels!.category.name,
                                style: CustomTextStyle.bodyTextStyle(bold: true),
                              ),
                              TextSpan(
                                text: ' - ${_eventDetailModels!.location}',
                                style: CustomTextStyle.bodyTextStyle(),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => openURILauncher(launchURL: _eventDetailModels!.locationLink),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // * Event Cover Image
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.largeSpace),
                        child: CustomCachedNetworkImage(
                          imageUrl: _eventDetailModels!.thumbnailImage,
                          config: CustomCachedNetworkImageConfig(
                            width: double.infinity,
                            height: 400,
                            backgroundColor: primaryColor.withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                          ),
                        ),
                      ),
                      // * Event Description
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
                        child: CustomHtmlWidget(
                          data: _eventDetailModels!.description,
                        ),
                      ),
                      // * Register Button
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: Dimen.largeSpace),
                        child: ElevatedButton(
                          onPressed: () => openURILauncher(launchURL: _eventDetailModels!.registerLink),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: Dimen.largeSpace,
                              horizontal: Dimen.largeSpace,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
                            ),
                          ),
                          child: Text(
                            'Resgister now',
                            style: CustomTextStyle.buttonTextStyle(
                              color: Colors.white,
                            ),
                          ),
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
