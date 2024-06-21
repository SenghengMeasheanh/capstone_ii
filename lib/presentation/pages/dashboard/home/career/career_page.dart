import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/pages/dashboard/home/career/career_detail_page.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  // * Controller
  final _searchBarController = TextEditingController();

  // * Models
  var _careerTypeList = <CareerTypeModels>[];

  @override
  void initState() {
    super.initState();
    // * Request Career Type List
    context.read<CareerBloc>().add(RequestCareerTypeListEvent());
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
      body: BlocListener<CareerBloc, CareerState>(
        listener: (context, state) {
          // * Request Career Type List Success State
          if (state is RequestCareerTypeListSuccessState) {
            // * Set Career Type List
            _careerTypeList = state.response.body.data;
            // * Notify
            setState(() {});
            // * Return
            return;
          }
          // ! Request Career Type List Error State
          if (state is RequestCareerTypeListErrorState) {
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
                    'Career',
                    style: CustomTextStyle.largeTitleTextStyle(bold: true),
                  ),
                ),
                // * Searchbar
                SearchBarWidget(
                  controller: _searchBarController,
                  onChange: (value) => {},
                ),
                // * Subitlet
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: Dimen.largeSpace),
                  child: Text(
                    'Find a career that works \n for you',
                    style: CustomTextStyle.largeTitleTextStyle(fontSize: Dimen.titleTextSize + 8, bold: true),
                    textAlign: TextAlign.center,
                  ),
                ),
                // * Filter Description
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                  child: Text(
                    'Filter by job category',
                    style: CustomTextStyle.bodyTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                // * Filter Menu
                Container(
                  margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                  child: Wrap(
                    spacing: 10,
                    children: _careerTypeList
                        .map(
                          (e) => _CareerType(
                            label: e.name,
                            isSelected: false,
                            onSelected: (value) => {},
                          ),
                        )
                        .toList(),
                  ),
                ),
                // * Career List
                Container(
                  margin: const EdgeInsets.only(top: Dimen.largeSpace),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ItemCareer(
                        onTap: () => context.push(destination: const CareerDetailPage()),
                      );
                    },
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

class _CareerType extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;
  const _CareerType({
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
