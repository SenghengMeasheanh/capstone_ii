import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/helper/styles/styles.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PreSignUpPage extends StatelessWidget {
  const PreSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Lottie
          Lottie.asset(Assets.lottieStudent, repeat: false),
          // * Go Sign Up Button
          Container(
            margin: const EdgeInsets.only(top: Dimen.largeSpace),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.defaultSpace * 2,
                  vertical: Dimen.defaultSpace,
                ),
              ),
              onPressed: () => context.push(destination: const SignUpPage()),
              child: Text('Go Sign Up', style: CustomTextStyle.bodyTextStyle()),
            ),
          ),
        ],
      ),
    );
  }
}
