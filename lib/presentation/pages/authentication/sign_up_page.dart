import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // * Form Key
  final _formKey = GlobalKey<FormState>();

  // * Text Controller
  final _fullnameTextController = TextEditingController();
  final _dateOfBirthTextController = TextEditingController();
  final _genderTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  // * Other
  DateTime? _savedPickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimen.contentPadding,
            right: Dimen.contentPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // * Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign Up', style: CustomTextStyle.largeTitleTextStyle(bold: true)),
                    // * Name Text Field
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Fullname',
                          prefixIcon: Icon(Icons.person_outline, size: 24),
                        ),
                      ),
                    ),
                    // * Birthday Picker
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        readOnly: true,
                        onTap: _onSelectDateOfBirthTap,
                        controller: _dateOfBirthTextController,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Birthday',
                          prefixIcon: Icon(Icons.calendar_today_outlined, size: 24),
                        ),
                      ),
                    ),
                    // * Gender Picker
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      width: double.maxFinite,
                      child: DropdownMenu(
                        width: 318.w,
                        leadingIcon: const Icon(Icons.wc, size: 24),
                        controller: _genderTextController,
                        onSelected: (value) => setState(() {
                          _genderTextController.text = value!;
                        }),
                        dropdownMenuEntries: Gender.values
                            .map(
                              (e) => DropdownMenuEntry(
                                value: getGender(value: e),
                                label: getGender(value: e),
                                leadingIcon: Icon(getIcon(value: e)),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    // * Email Text Field
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined, size: 24),
                        ),
                      ),
                    ),
                    // * Password Text Field
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline, size: 24),
                        ),
                      ),
                    ),
                    // * Confirm Password Text Field
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      height: 56,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock_outline, size: 24),
                        ),
                      ),
                    ),
                    // * Sign Up Button
                    Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_right),
                        label: const Text('SIGN UP'),
                      ),
                    ),
                  ],
                ),
                // * Sign Up
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: Dimen.defaultSpace * 2,
                  ),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.bodyTextStyle(),
                    const TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '\tSign Up',
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

  Future<void> _onSelectDateOfBirthTap() async {
    // * Await Show Date Picker
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _savedPickedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    // * If Picked Date Not Equal Null
    if (pickedDate != null) {
      // * Save Picked Date
      _savedPickedDate = pickedDate;
      // * Set Picked Date
      _dateOfBirthTextController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}
