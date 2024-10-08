
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? validateEmptyField(String? value) {
    // * Validate Empty Field
    if (value != null && value.isEmpty) {
      return tr(LocaleKeys.please_fill_the_information);
    }
    return null;
  }

  static String? validateEmail(String? value) {
    // * Validate
    if (value != null) {
      // * Validate Email
      if (!emailRegExp.hasMatch(value)) {
        return tr(LocaleKeys.invalid_email);
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    // * Validate
    if (value != null) {
      // * Validate Empty Field
      if (value.isEmpty) {
        return tr(LocaleKeys.please_fill_the_information);
      }
      // * Validate Phone Number
      if (value.length < 9 || value.length > 10) {
        return tr('');
      }
    }
    return null;
  }

  static String? validatePasswordMatch(
    String? value, {
    required String passToBeMatch,
  }) {
    // * Validate
    if (value != null) {
      // * Validate Empty Field
      if (value.isEmpty) {
        return tr(LocaleKeys.please_fill_the_information);
      }
      // * Validate Password Length
      if (value.length < 8) {
        return tr(LocaleKeys.password_must_be_at_least_8_characters_long);
      }
      // * Validate Special Character
      if (!RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
        return tr(LocaleKeys.password_must_contain_at_least_one_symbol);
      }
      // * Validate Password To Be Match
      if (value != passToBeMatch) {
        return tr(LocaleKeys.new_and_confirm_password_must_be_the_same);
      }
    }
    return null;
  }
}

// * Regex
final emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
