import 'package:capstone_ii/helper/helper_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value) onChange;
  const SearchBarWidget({super.key, required this.controller, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: TextFormField(
        onChanged: onChange,
        decoration: InputDecoration(
          isDense: true,
          hintText: tr(LocaleKeys.search),
          hintStyle: CustomTextStyle.captionTextStyle(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimen.defaultRadius),
          ),
        ),
      ),
    );
  }
}
