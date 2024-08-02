import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class UnderCostructionPage extends StatelessWidget {
  const UnderCostructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Text(
            'Coming Soon',
            style: CustomTextStyle.largeTitleTextStyle(
              bold: true,
              color: primaryColor,
            ),
          ),
        ));
  }
}
