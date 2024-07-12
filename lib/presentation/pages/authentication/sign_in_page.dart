import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // * Progress Dialog
  final _progressDialog = ProgressDialog();

  // * Others
  var _isPasswordObsecure = true;
  var _isRememberMe = false;

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // * Dismiss Progress Dialog
        if (_progressDialog.isShowing) _progressDialog.dismiss();
        // * Request Sign In Success
        if (state is RequestSignInSuccessState) {
          // * Go to Dashboard Page
          context.go(destination: const DashboardPage());
          // * Return
          return;
        }
        // ! Request Sign In Error
        if (state is RequestSignInErrorState) {
          // * Show Error Dialog
          context.showInfoSnackBar(msg: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.contentPadding),
              child: Column(
                children: [
                  // * Logo
                  Image.asset(Assets.imageLogo, width: 280, height: 280),
                  // * Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(LocaleKeys.sign_in),
                        style: CustomTextStyle.largeTitleTextStyle(bold: true),
                        textAlign: TextAlign.left,
                      ),
                      // * Email Text Field
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                        child: TextFormField(
                          validator: (value) => Validator.validateEmptyField(value),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: tr(LocaleKeys.email),
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
                        child: TextFormField(
                          controller: _passwordTextController,
                          validator: (value) => Validator.validateEmptyField(value),
                          obscureText: _isPasswordObsecure,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            border: const OutlineInputBorder(),
                            hintText: tr(LocaleKeys.password),
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
                              value: _isRememberMe,
                              activeColor: primaryColor,
                              onChanged: (value) {
                                setState(() => _isRememberMe = value);
                              },
                            ),
                            Text(tr(LocaleKeys.remember_me), style: CustomTextStyle.bodyTextStyle()),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(tr(LocaleKeys.forgot_password), style: CustomTextStyle.bodyTextStyle()),
                        ),
                      ],
                    ),
                  ),
                  // * Sign In Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _onSignInTap,
                      child: Text(
                        tr(LocaleKeys.sign_in).toUpperCase(),
                        style: CustomTextStyle.buttonTextStyle(),
                      ),
                    ),
                  ),
                  // * Sign Up
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: Dimen.defaultSpace * 2,
                    ),
                    child: Text.rich(
                      style: CustomTextStyle.bodyTextStyle(),
                      TextSpan(
                        text: tr(LocaleKeys.dont_have_an_account),
                        style: CustomTextStyle.bodyTextStyle(),
                        children: [
                          TextSpan(
                            text: ' ${tr(LocaleKeys.sign_up)}',
                            style: CustomTextStyle.bodyTextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.push(destination: const SignUpPage()),
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
      ),
    );
  }

  // * Sign In
  Future<void> _onSignInTap() async {
    // * Validate Form
    if (!_formKey.currentState!.validate()) return;
    // * Show Progress Dialog
    _progressDialog.show();
    // * Init Sign In Request
    final signInRequest = SignInRequest(
      email: _emailTextController.text.trim(),
      password: _passwordTextController.text,
    );
    // * Gasp
    if (!mounted) return;
    // * Request Sign In
    context.read<AuthBloc>().add(RequestSignInEvent(signInRequest: signInRequest));
  }
}
