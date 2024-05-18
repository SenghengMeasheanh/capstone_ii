import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

MaterialColor getPrimaryMaterialColor(Color color) {
  // * Variable
  var strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  // * Loop
  for (int i = 1; i < 10; i++) {
    // * Add Strengths
    strengths.add(0.1 * i);
  }

  // * Loop Strengths
  for (final strength in strengths) {
    // * Init DS
    final ds = 0.5 - strength;
    // * Init Color Swatch
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  // * Return Material Color
  return MaterialColor(color.value, swatch);
}

final appBarTheme = AppBarTheme(
  toolbarTextStyle: CustomTextStyle.largeTitleTextStyle(bold: true, color: Colors.white),
);

final snackBarTheme = SnackBarThemeData(
  contentTextStyle: CustomTextStyle.titleTextStyle(color: Colors.white),
);

const modalBottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
);

final textFormFieldTheme = InputDecorationTheme(
  hintStyle: CustomTextStyle.bodyTextStyle(color: Colors.grey),
  labelStyle: CustomTextStyle.bodyTextStyle(color: Colors.grey),
  errorStyle: CustomTextStyle.captionTextStyle(color: Colors.red),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(Dimen.textFieldRadius),
  ),
);

class CustomTextStyle {
  static TextStyle largeTitleTextStyle({
    Color? color,
    bool bold = false,
    double fontSize = Dimen.largeTitleTextSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : fontWeight,
    );
  }

  static TextStyle titleTextStyle({
    Color? color,
    TextDecoration? decoration,
    bool bold = false,
    double fontSize = Dimen.titleTextSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : fontWeight,
    );
  }

  static TextStyle bodyTextStyle({
    Color? color,
    TextDecoration? decoration,
    bool bold = false,
    double fontSize = Dimen.bodyTextSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : fontWeight,
    );
  }

  static TextStyle captionTextStyle({
    Color? color,
    bool bold = false,
    double fontSize = Dimen.captionTextSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : fontWeight,
    );
  }

  static TextStyle buttonTextStyle({
    Color? color,
    double fontSize = Dimen.buttonTextSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }
}
