import 'package:capstone_ii/helper/helper_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InfoDialog with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
    required String title,
    required String message,
    String? negativeBtnText,
    String? positiveBtnText,
    Color? positiveBtnBgColor,
    bool negativeBtnVisible = true,
    bool positiveBtnVisible = true,
    void Function()? onNegativeTap,
    void Function()? onPositiveTap,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showDialog<T>(
      context: context ?? getCurrentContext,
      barrierDismissible: false,
      builder: (_) => _InfoDialog(
        title: title,
        message: message,
        negativeBtnVisible: negativeBtnVisible,
        positiveBtnVisible: positiveBtnVisible,
        onNegativeTap: onNegativeTap,
        onPositiveTap: onPositiveTap,
        positiveBtnBgColor: positiveBtnBgColor ?? primaryColor,
        negativeBtnText: negativeBtnText ?? tr(LocaleKeys.cancel),
        positiveBtnText: positiveBtnText ?? tr(LocaleKeys.ok),
      ),
    ).then((result) {
      // * Set [isShowing] False
      _isShowing = false;
      // * Return Result
      return result;
    });
  }

  // * Get Dialog Showing
  bool get isShowing => _isShowing;
}

class _InfoDialog extends StatelessWidget with ModalUtilsMixin {
  final String title;
  final String message;
  final String negativeBtnText;
  final String positiveBtnText;
  final bool negativeBtnVisible;
  final bool positiveBtnVisible;
  final Color positiveBtnBgColor;
  final void Function()? onNegativeTap;
  final void Function()? onPositiveTap;

  const _InfoDialog({
    required this.title,
    required this.message,
    required this.negativeBtnText,
    required this.positiveBtnText,
    required this.negativeBtnVisible,
    required this.positiveBtnVisible,
    required this.positiveBtnBgColor,
    this.onNegativeTap,
    this.onPositiveTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        scrollable: true,
        contentPadding: const EdgeInsets.all(Dimen.contentPadding),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Title
            Text(title, style: CustomTextStyle.titleTextStyle(bold: true)),
            // * Message
            Container(
              margin: const EdgeInsets.symmetric(vertical: Dimen.defaultSpace),
              child: Text(message, style: CustomTextStyle.bodyTextStyle()),
            ),
            // * Negative & Positive Button
            Row(
              children: [
                // * Negative Button
                Visibility(
                  visible: negativeBtnVisible,
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: Dimen.smallSpace),
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          // * Dismiss Dialog
                          dismiss();
                          // * Call Function
                          onNegativeTap?.call();
                        },
                        child: Text(negativeBtnText, style: CustomTextStyle.buttonTextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                // * Positive Button
                Visibility(
                  visible: positiveBtnVisible,
                  child: Expanded(
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: Dimen.smallSpace),
                      child: ElevatedButton(
                        onPressed: () {
                          // * Dismiss Dialog
                          dismiss();
                          // * Call Function
                          onPositiveTap?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: positiveBtnBgColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                        child: Text(positiveBtnText, style: CustomTextStyle.buttonTextStyle()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
