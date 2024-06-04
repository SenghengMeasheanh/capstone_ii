import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class ProgressDialog with ModalUtilsMixin {
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
      barrierDismissible: false,
      builder: (_) => const _ProgressDialog(),
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

class _ProgressDialog extends StatelessWidget {
  const _ProgressDialog();

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: ProgressBar(),
    );
  }
}
