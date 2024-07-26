import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaticPagesPage extends StatefulWidget {
  final String alias;
  final String title;
  const StaticPagesPage({
    super.key,
    required this.alias,
    required this.title,
  });

  @override
  State<StaticPagesPage> createState() => _StaticPagesPageState();
}

class _StaticPagesPageState extends State<StaticPagesPage> {
  // * Variable
  var _content = '';

  @override
  void initState() {
    super.initState();
    // * Request Static Pages
    context.read<SettingsBloc>().add(RequestStaticPageEvent(alias: widget.alias));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          // * Request Static Pages Success
          if (state is RequestStaticPageSuccessState) {
            // * Set Content
            _content = state.response.body.data.first.content;
            // * Nofity
            setState(() {});
            // * Return
            return;
          }
          // ! Request Static Pages Error
          if (state is RequestStaticPageErrorState) {
            // * Return
            return;
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                  visible: _content.isNotEmpty,
                  replacement: const ProgressBar(),
                  child: CustomHtmlWidget(data: _content),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
