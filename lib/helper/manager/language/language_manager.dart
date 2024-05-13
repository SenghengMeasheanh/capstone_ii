import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageManager {
  static final supportedLanguage = [
    const Locale('en', 'US'),
    const Locale('km', 'KH'),
  ];

  static const defaultLanguage = Locale('en', 'US');
  static const khmerLanguage = Locale('km', 'KH');
}

// * Extension
extension LanguageManagerExtension on BuildContext {
  // * Get Default Language
  bool get getDefaultLanguage => locale == LanguageManager.defaultLanguage ? true : false;
}
