import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // * Form Key
  final _formKey = GlobalKey<FormState>();

  // * Text Controller
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimen.contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Title
                Text(
                  'Forgot Password',
                  style: CustomTextStyle.largeTitleTextStyle(bold: true),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: Dimen.mediumSpace),
                // * Subtitle
                Text(
                  'Please enter your email for verification.',
                  style: CustomTextStyle.bodyTextStyle(),
                ),
                // * Email Text Field
                Container(
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
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
                // * Submit Button
                Container(
                  margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
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
