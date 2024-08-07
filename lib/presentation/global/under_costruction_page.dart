import 'package:capstone_ii/helper/helper_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          tr(LocaleKeys.coming_soon),
          style: CustomTextStyle.largeTitleTextStyle(
            bold: true,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
