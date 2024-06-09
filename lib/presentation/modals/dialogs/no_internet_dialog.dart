import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NoInternetDialog with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showDialog<T>(
      context: context ?? getCurrentContext,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (_) => const _NoInternetDialog(),
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

class _NoInternetDialog extends StatefulWidget {
  const _NoInternetDialog();

  @override
  State<_NoInternetDialog> createState() => _NoInternetDialogState();
}

class _NoInternetDialogState extends State<_NoInternetDialog> with ModalUtilsMixin {
  // * Variable
  final _btnRefreshController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            // * Lottie
            ColorFiltered(
              colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
              child: Lottie.asset(Assets.lottieNoInternet, width: 90, height: 90),
            ),
            // * Title
            Container(
              margin: const EdgeInsets.only(bottom: Dimen.smallSpace),
              child: Text('', style: CustomTextStyle.titleTextStyle()),
            ),
            // * Message
            Text(
              '',
              textAlign: TextAlign.center,
              style: CustomTextStyle.bodyTextStyle(),
            ),
            // * Refresh Button
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.only(top: Dimen.defaultSpace),
              child: RoundedLoadingButton(
                color: primaryColor,
                controller: _btnRefreshController,
                onPressed: () => _onRefreshTap(),
                child: Text('', style: CustomTextStyle.buttonTextStyle()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onRefreshTap() {
    // * Check Connection
    Connectivity().checkConnectivity().then((connectionResult) {
      // * If No Connection
      if (connectionResult.contains(ConnectivityResult.none)) {
        // * Reset
        _btnRefreshController.reset();
        // * Return
        return;
      }
      // * Dismiss Dialog
      dismiss();
    });
  }
}
