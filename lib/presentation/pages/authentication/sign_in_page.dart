import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              children: [
                // * Logo
                Image.asset(Assets.imageLogo, width: 280),
                // * Title
                Text(
                  'Login',
                  style: CustomTextStyle.largeTitleTextStyle(),
                  textAlign: TextAlign.left,
                ),
                // * Email Text Field
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 56,
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
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
                  margin: const EdgeInsets.only(top: 15),
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
                // * Remember Me and Forgot Password
                Container(
                  margin: const EdgeInsets.only(top: 15),
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
                  margin: const EdgeInsets.only(top: 15),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right),
                    label: const Text('Sign In'),
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
