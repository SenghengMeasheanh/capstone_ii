import 'package:capstone_ii/helper/helper_export.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Dimen.contentPadding,
          right: Dimen.contentPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Title
            Text('Verification', style: CustomTextStyle.largeTitleTextStyle(bold: true)),
            // * Space
            const SizedBox(
              height: Dimen.defaultSpace,
            ),
            // * Subtitle
            Text.rich(
              TextSpan(
                text: 'We\'ve send you the verification to this email: ',
                children: [
                  TextSpan(
                    text: 'your email',
                    style:
                        CustomTextStyle.bodyTextStyle(color: primaryColor, decoration: TextDecoration.underline),
                  ),
                ],
              ),
              style: CustomTextStyle.bodyTextStyle(),
            ),
            Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                Assets.lottieMessageSent,
                width: 350.w,
                height: 350.h,
              ),
            ),
            // * Resend Email
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Email',
                  style: CustomTextStyle.bodyTextStyle(color: primaryColor, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
