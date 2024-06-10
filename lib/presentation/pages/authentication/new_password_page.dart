import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  // * Form Key
  final _formKey = GlobalKey<FormState>();
  // * Text Controller
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  // * Text Controller
  var _isPasswordObsecure = true;
  var _isConfirmPasswordObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // *Title
              Text(
                'New Password',
                style: CustomTextStyle.largeTitleTextStyle(bold: true),
              ),
              const SizedBox(height: Dimen.mediumSpace),
              // * Subtitle
              Text(
                'Please create new strong password consist of\ncapital letters, normal, number and special character',
                textAlign: TextAlign.left,
                style: CustomTextStyle.captionTextStyle(),
              ),
              // * Password Text Field
              Container(
                margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  controller: _passwordTextController,
                  obscureText: _isPasswordObsecure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline, size: 24),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _isPasswordObsecure = !_isPasswordObsecure),
                      icon: Icon(_isPasswordObsecure ? Icons.visibility : Icons.visibility_off),
                      iconSize: 24,
                    ),
                  ),
                ),
              ),
              // * Confirm Password Text Field
              Container(
                margin: EdgeInsets.only(top: Dimen.defaultSpace.h),
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  controller: _confirmPasswordTextController,
                  obscureText: _isConfirmPasswordObsecure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline, size: 24),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _isConfirmPasswordObsecure = !_isConfirmPasswordObsecure),
                      icon: Icon(_isConfirmPasswordObsecure ? Icons.visibility : Icons.visibility_off),
                      iconSize: 24,
                    ),
                  ),
                ),
              ),
              // * Confirm Button
              Container(
                margin: EdgeInsets.only(top: Dimen.defaultSpace.h * 2),
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Confirm',
                    style: CustomTextStyle.titleTextStyle(bold: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
