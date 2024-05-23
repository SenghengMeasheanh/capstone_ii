import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // * Form Key
  final _formKey = GlobalKey<FormState>();

  // * Text Controller
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // * Others
  var _isPasswordObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formKey,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              children: [
                // * Logo
                Image.asset(Assets.imageLogo, width: 280.w, height: 280.h),
                // * Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                      textAlign: TextAlign.left,
                    ),
                    // * Email Text Field
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email_outlined, size: 24),
                          suffixIcon: Visibility(
                            visible: _emailTextController.text.isNotEmpty,
                            child: IconButton(
                              onPressed: () => setState(() => _emailTextController.clear()),
                              icon: const Icon(Icons.clear),
                              iconSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // * Password Text Field
                    Container(
                      margin: EdgeInsets.only(top: Dimen.defaultSpace.h),
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
                  ],
                ),
                // * Remember Me and Forgot Password
                Container(
                  margin: EdgeInsets.only(top: Dimen.defaultSpace.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CupertinoSwitch(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text('Remember Me', style: CustomTextStyle.bodyTextStyle()),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?', style: CustomTextStyle.bodyTextStyle()),
                      ),
                    ],
                  ),
                ),
                // * Sign In Button
                Container(
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right),
                    label: const Text('SIGN IN'),
                  ),
                ),
                // * Sign Up
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: Dimen.defaultSpace * 2,
                  ),
                  child: Text.rich(
                    style: CustomTextStyle.bodyTextStyle(),
                    const TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
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
