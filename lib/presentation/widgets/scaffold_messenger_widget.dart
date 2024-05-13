import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:capstone_ii/helper/helper_export.dart';

// * Scaffold Messenger Key
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

// * Scaffold Messenger Utils Extension
extension ScaffoldMessengerUtils on BuildContext {
  void showInfoSnackBar({
    required String msg,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(Dimen.contentPadding),
      content: Row(
        children: [
          // * Lottie
          Container(
            margin: const EdgeInsets.only(right: Dimen.smallSpace),
            decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(20)),
            child: Lottie.asset(Assets.lottieInfo, width: 45, height: 45),
          ),
          // * Message
          Flexible(child: Text(msg, textAlign: TextAlign.start)),
        ],
      ),
    );
    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSuccessSnackBar({
    required String msg,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(Dimen.contentPadding),
      content: Row(
        children: [
          // * Lottie
          Container(
            margin: const EdgeInsets.only(right: Dimen.smallSpace),
            decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(20)),
            child: Lottie.asset(Assets.lottieSuccess, width: 45, height: 45, repeat: false),
          ),
          // * Message
          Flexible(child: Text(msg, textAlign: TextAlign.start)),
        ],
      ),
    );
    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
