import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:open_file/open_file.dart';

class DownloadingProgressDialog with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
    String? downloadUrl,
    required String fileName,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showDialog<T>(
      context: context ?? getCurrentContext,
      useRootNavigator: false,
      barrierDismissible: true,
      builder: (_) => _DownloadingProgressDialog(
        downloadUrl: downloadUrl,
        fileName: fileName,
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

class _DownloadingProgressDialog extends StatefulWidget {
  final String? downloadUrl;
  final String fileName;
  const _DownloadingProgressDialog({
    required this.downloadUrl,
    required this.fileName,
  });

  @override
  State<_DownloadingProgressDialog> createState() => _DownloadingProgressDialogState();
}

class _DownloadingProgressDialogState extends State<_DownloadingProgressDialog> with ModalUtilsMixin {
  // * Cancel Token
  final _cancelToken = CancelToken();

  // * Others
  var _progress = 0.0;
  var _downloadedSize = 0.0;
  var _totalSize = 0.0;

  // * Init State
  @override
  void initState() {
    super.initState();
    // * Try Download File
    _tryDownloadFile();
  }

  // * Try Download File
  Future<void> _tryDownloadFile() async {
    // * Awaiting for Download File Stream
    await downloadFile(
        url: widget.downloadUrl,
        onDownloadProgress: _setDownloadProgress,
        cancelToken: _cancelToken,
        onSuccess: (result) => _doOnComplete(msg: result),
        onFailed: (result) => _doOnComplete(msg: result),
        onDownloadCompleted: (filePath) => _openFile(filePath),
        fileName: widget.fileName,
      );
  }

  // * Open File
  void _openFile(String filePath) {
    // * Open File
    OpenFile.open(filePath);
    // * Dismiss Dialog
    dismiss();
  }

  // * Set Download Progress
  void _setDownloadProgress(
    double progress,
    double downloadedSize,
    double totalSize,
  ) {
    // * Set Progress
    _progress = progress;
    _downloadedSize = downloadedSize;
    _totalSize = totalSize;
    // * Notify
    setState(() {});
  }

  void _doOnComplete({
    required String msg,
  }) {
    // ! Show Snack Bar
    context.showInfoSnackBar(msg: msg);
    // * Dismiss Dialog
    dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        scrollable: true,
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // * Title
              Text(
                'Downloading File',
                style: CustomTextStyle.largeTitleTextStyle(bold: true),
              ),
              // * Subtitle
              Container(
                margin: const EdgeInsets.symmetric(vertical: Dimen.largeSpace),
                child: Text(
                  'Please wait while the file is ${_progress == 100 ? 'installing' : 'downloading'}',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.largeTitleTextStyle(),
                ),
              ),
              // * Progress Indicator
              Container(
                margin: const EdgeInsets.symmetric(vertical: Dimen.largeSpace),
                child: LinearProgressIndicator(
                  backgroundColor: primaryColor.withOpacity(0.2),
                  value: _progress != 0 && _progress < 100 ? _progress / 100 : null,
                ),
              ),
              // * Progress Detail
              Visibility(
                visible: _progress != 0 && _progress < 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // * Progress In Percentage
                    Text('$_progress%', style: CustomTextStyle.bodyTextStyle(bold: true)),
                    Text('$_downloadedSize/$_totalSize MB', style: CustomTextStyle.bodyTextStyle(bold: true)),
                  ],
                ),
              ),
              // * Cancel Button
              Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                child: ElevatedButton(
                  onPressed: () => _cancelToken.cancel(),
                  child: Text('Cancel', style: CustomTextStyle.buttonTextStyle()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
