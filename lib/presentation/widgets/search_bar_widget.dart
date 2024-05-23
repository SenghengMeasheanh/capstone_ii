import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      child: TextFormField(
        readOnly: true,
        onTap: () => {},
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search',
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
