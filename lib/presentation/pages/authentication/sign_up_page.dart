import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/bloc/auth/auth_bloc.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // * Progress dialog
  final _progressDialog = ProgressDialog();

  // * Other
  DateTime? _savedPickedDate;
  bool _isPasswordObsecure = true;
  bool _isConfirmObsecure = true;
  bool _isAgreeTerms = false;

  @override
  void dispose() {
    super.dispose();
    _fullnameTextController.dispose();
    _dateOfBirthTextController.dispose();
    _confirmPasswordTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // * Dimiss Progress Dialog
          if (_progressDialog.isShowing) _progressDialog.dismiss();
          // * Request Sign Up Success
          if (state is RequestSignUpSuccessState) {
            // * Show Success Snack Bar
            context.showSuccessSnackBar(msg: state.msg);
            // * Push Replace To Login
            context.pushReplaceTo(destination: const SignInPage());
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Dimen.contentPadding,
                right: Dimen.contentPadding,
              ),
              child: Column(
                children: [
                  // * Title
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tr(LocaleKeys.sign_up),
                      style: CustomTextStyle.largeTitleTextStyle(bold: true),
                    ),
                  ),
                  // * Name Text Field
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: TextFormField(
                      controller: _fullnameTextController,
                      validator: (value) => Validator.validateEmptyField(value),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: tr(LocaleKeys.fullname),
                        prefixIcon: const Icon(Icons.person_outline, size: 24),
                      ),
                    ),
                  ),
                  // * Birthday Picker
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: TextFormField(
                      readOnly: true,
                      validator: (value) => Validator.validateEmptyField(value),
                      onTap: _onSelectDateOfBirthTap,
                      controller: _dateOfBirthTextController,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: tr(LocaleKeys.birthday),
                        prefixIcon: const Icon(Icons.calendar_today_outlined, size: 24),
                      ),
                    ),
                  ),
                  // * Gender Picker
                  Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      child: TextFormField(
                        readOnly: true,
                        validator: (value) => Validator.validateEmptyField(value),
                        controller: _genderTextController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: tr(LocaleKeys.select_gender),
                          prefixIcon: const Icon(Icons.wc, size: 24),
                          suffixIcon: PopupMenuButton(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (value) => {_genderTextController.text = value},
                            itemBuilder: (context) => Gender.values
                                .map(
                                  (e) => PopupMenuItem<String>(
                                    value: getGender(value: e),
                                    child: Row(
                                      children: [
                                        Icon(getIcon(value: e)),
                                        Text(
                                          getGender(value: e),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )),
                  // * Email Text Field
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: TextFormField(
                      controller: _emailTextController,
                      validator: (value) => Validator.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: tr(LocaleKeys.email),
                        prefixIcon: const Icon(Icons.email_outlined, size: 24),
                      ),
                    ),
                  ),
                  // * Password Text Field
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: TextFormField(
                      validator: (value) => Validator.validatePasswordMatch(
                        value,
                        passToBeMatch: _confirmPasswordTextController.text,
                      ),
                      obscureText: _isPasswordObsecure,
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        isDense: true,
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
                  // * Confirm Password Text Field
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: TextFormField(
                      validator: (value) => Validator.validatePasswordMatch(
                        value,
                        passToBeMatch: _passwordTextController.text,
                      ),
                      controller: _confirmPasswordTextController,
                      obscureText: _isConfirmObsecure,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: tr(LocaleKeys.confirm_password),
                        prefixIcon: const Icon(Icons.lock_outline, size: 24),
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _isConfirmObsecure = !_isConfirmObsecure),
                          icon: Icon(_isConfirmObsecure ? Icons.visibility : Icons.visibility_off),
                          iconSize: 24,
                        ),
                      ),
                    ),
                  ),
                  // * Terms and Conditions and Privacy Policy
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isAgreeTerms,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) => {
                        setState(() => _isAgreeTerms = value!),
                      },
                      title: Text.rich(
                        overflow: TextOverflow.clip,
                        TextSpan(
                          text: '${tr(LocaleKeys.i_agree_to_the)} ',
                          style: CustomTextStyle.bodyTextStyle(),
                          children: [
                            TextSpan(
                              text: tr(LocaleKeys.terms_and_conditions),
                              style: CustomTextStyle.bodyTextStyle(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: ' ${tr(LocaleKeys.and)} '),
                            TextSpan(
                              text: tr(LocaleKeys.privacy_policy),
                              style: CustomTextStyle.bodyTextStyle(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // * Sign Up Button
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.defaultSpace * 2),
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      iconAlignment: IconAlignment.end,
                      onPressed: () => _isAgreeTerms
                          ? _onSignUpTap()
                          : context.showInfoSnackBar(
                              msg: tr(LocaleKeys.please_agree_to_our_terms_and_condition_and_pivacy_policy)),
                      child: Text(
                        tr(LocaleKeys.sign_up).toUpperCase(),
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
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.bodyTextStyle(),
                      TextSpan(
                        text: tr(LocaleKeys.already_have_an_account),
                        style: CustomTextStyle.bodyTextStyle(),
                        children: [
                          TextSpan(
                            text: '\t${tr(LocaleKeys.sign_in)}',
                            style: CustomTextStyle.bodyTextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.push(destination: const SignInPage()),
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

  void _onSignUpTap() {
    // * Validate Form
    if (!_formKey.currentState!.validate()) return;
    // * Show Progress Dialog
    _progressDialog.show();
    // * Init Sign Up Request
    final signUpRequest = SignUpRequest(
      name: _fullnameTextController.text.trim().toLowerCase(),
      birthday: _dateOfBirthTextController.text.trim(),
      gender: _genderTextController.text.toLowerCase(),
      email: _emailTextController.text.trim().toLowerCase(),
      password: _passwordTextController.text,
      passwordConfirmation: _confirmPasswordTextController.text,
    );
    // * Request Sign Up
    context.read<AuthBloc>().add(RequestSignUpEvent(signUpRequest: signUpRequest));
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
      _dateOfBirthTextController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
