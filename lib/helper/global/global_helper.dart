import 'dart:core';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:android_id/android_id.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

// * Clear And Restart
void clearAndRestart({
  bool showSessionExpiredDialog = false,
}) {
  // * Clear Credential
  AppPreference.clearCredential();
  // * Go To Dashboard Page
  getCurrentContext.go(destination: const DashboardPage());
  // * If Show Session Expired Dialog
  if (showSessionExpiredDialog) {
    // ! Show Info Dialog
    InfoDialog().show(
      title: tr(LocaleKeys.session_expired),
      message: tr(LocaleKeys.please_login_again),
      negativeBtnVisible: false,
    );
  }
}

// * Request Refresh Token
Future<void> fetchRefreshToken() async {
  // *  Init Auth Repo
  final authRepo = AuthRepo();
  // *  Get Result
  final result = authRepo.requestRefreshToken();
  // * Await Result
  await result.then(
    (response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        // * Set Token
        AppPreference.saveAccessToken(response.body!.token);
      }
    },
    onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Request Refresh Token Again
        fetchRefreshToken();
      }
    },
  );
}

// // * Crop Image
// Future<String?> cropImage({
//   required String sourcePath,
// }) async {
//   final croppedImage = await ImageCropper().cropImage(
//     sourcePath: sourcePath,
//     cropStyle: CropStyle.circle,
//     compressQuality: 80,
//     compressFormat: ImageCompressFormat.jpg,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.square,
//       CropAspectRatioPreset.ratio3x2,
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.ratio4x3,
//       CropAspectRatioPreset.ratio16x9,
//     ],
//     uiSettings: [
//       AndroidUiSettings(
//         toolbarTitle: tr(LocaleKeys.edit_photo),
//         toolbarColor: primaryColor,
//         toolbarWidgetColor: Colors.white,
//         cropFrameColor: Colors.transparent,
//         initAspectRatio: CropAspectRatioPreset.original,
//         activeControlsWidgetColor: primaryColor,
//         showCropGrid: false,
//       ),
//       IOSUiSettings(
//         title: tr(LocaleKeys.edit_photo),
//       ),
//     ],
//   );
//   return croppedImage?.path;
// }

// Future<void> downloadImage({
//   required String image,
// }) async {
//   // * Show Progress Dialog
//   final progressDialog = ProgressDialog()..show();
//   // * Init File URL
//   final fileUrl = getSlideURL(data: image);
//   // * Init Save Path
//   final savePath = await getApplicationDocumentsDirectory();
//   // * Init File Path
//   final filePath = '${savePath.path}/images/${image.replaceAll('/upload', '')}';
//   // * If File Not Exist
//   if (!File(filePath).existsSync()) {
//     // * Try
//     try {
//       // * Download Image
//       await Dio().download(fileUrl, filePath);
//     }
//     // ! On Error
//     catch (_) {
//       // * Dismiss Progress Dialog
//       progressDialog.dismiss();
//       // ! Show Snack Bar
//       if (getCurrentContext.mounted) getCurrentContext.showInfoSnackBar(msg: tr(LocaleKeys.download_failed));
//       // * Return
//       return;
//     }
//   }
//   // * Dismiss Progress Dialog
//   progressDialog.dismiss();
//   // * Put Image In Gallery
//   await Gal.putImage(filePath);
//   // * Show Snack Bar
//   if (getCurrentContext.mounted) getCurrentContext.showSuccessSnackBar(msg: tr(LocaleKeys.download_success));
// }

// // * Get Slide URL
// String getSlideURL({
//   required String? data,
// }) {
//   return '${Flavor.instance.fileURL}$data';
// }

// // * Get Profile URL
// String getProfileURL({
//   required String? data,
// }) {
//   return '${Flavor.instance.apiURL}$data';
// }

// // * Get WebView URL
// String getWebViewURL({
//   required String? data,
// }) {
//   return '${Flavor.instance.webViewURL}$data';
// }

typedef OnDownloadProgressCallback = void Function(double progress, double downloadedSize, double totalSize);
typedef OnDownloadCompletedCallback = void Function(String filePath);
Future<void> downloadFile({
  String? url,
  required CancelToken cancelToken,
  required OnDownloadProgressCallback onDownloadProgress,
  required OnDownloadCompletedCallback onDownloadCompleted,
  required void Function(String) onSuccess,
  required void Function(String) onFailed,
  required String fileName,
}) async {
  // * Get Save Path
  final savePath = await getExternalStorageDirectory();
  // * File Path
  final filePath = '${savePath!.uri.toFilePath()}/$fileName';
  // * Check iF URL null
  if (url != null) {
    // * Try Download
    try {
      await Dio().download(
        url,
        filePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          // * Progress
          final progress = (received / total * 100).floorToDouble();
          final downloadedSize = (received / 1024 / 1024).floorToDouble();
          final totalSize = (total / 1024 / 1024).floorToDouble();
          // * Progress
          onDownloadProgress(progress, downloadedSize, totalSize);
          // * If Progress Bigger Than 100
          if (progress >= 100) {
            // * Call On Completed
            onDownloadCompleted.call(filePath);
            // * Log Download Success
            developer.log('Download Success: $filePath');
          }
        },
      );
    }
    // ! On Error
    catch (e) {
      // ! Call On Failed
      onFailed.call(e.toString());
    }
  } else {
    // ! Call on Failed
    onFailed.call('The university doesn\'t provide any admission');
  }
}

// * Get Data Based On Current Language
String getDataBasedOnCurrentLanguage({required String kh, required String en, t}) {
  final map = {
    LanguageManager.defaultLanguage: en,
    LanguageManager.khmerLanguage: kh,
  };
  return map[getCurrentContext.locale] ?? '';
}

// * Get Error Content
String getErrorContent({
  required dynamic exception,
  required dynamic stackTrace,
}) {
  return '------------- Exception ---------------'
          '\n\n$exception\n\n'
          '------------- Stack Trace -------------'
          '\n\n$stackTrace\n\n'
      .trim();
}

// * Get Devices Info
Future<String> getDeviceId() async {
  // * unique ID on Android
  if (Platform.isAndroid) {
    final androidDeviceInfo = await const AndroidId().getId();
    return androidDeviceInfo ?? 'Unknown';
  }
  // * unique ID on iOS
  else if (Platform.isIOS) {
    final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
    return iosDeviceInfo.identifierForVendor ?? 'Unknown';
  }
  return 'Unknown';
}

Future<String> getDeviceName() async {
  // * Get Device Info
  final deviceInfo = DeviceInfoPlugin();
  // * unique ID on Android
  if (Platform.isAndroid) {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.model;
  }
  // * unique ID on iOS
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.utsname.machine;
  }
  return 'Unknown';
}

String getDeviceToken() {
  final deviceToken = OneSignal.User.pushSubscription.id;
  return deviceToken ?? 'Unknown';
}

// * Others
bool isSignedIn() {
  return AppPreference.getAccessToken != null;
}

Future<void> openBrowserURL({
  required String url,
}) async {
  // * Launch URL
  await launchUrlString(url, mode: LaunchMode.externalApplication);
}

Future<void> openURILauncher({
  required String launchURL,
  void Function()? onLaunchFailed,
}) async {
  // * If Can Launch URL String
  if (await canLaunchUrlString(launchURL)) {
    // * Launch URL String
    await launchUrlString(launchURL);
  }
  // * Can't Launch URL String
  else {
    // * Call On Failed
    onLaunchFailed?.call();
  }
}

double calculateCacheSize({
  Directory? appCacheDirectory,
}) {
  if (appCacheDirectory != null && appCacheDirectory.existsSync()) {
    double totalSize = 0.0;
    appCacheDirectory.listSync(recursive: true).forEach((file) {
      // * Init Cache Size
      if (file is File) totalSize += file.lengthSync();
    });
    return totalSize;
  } else {
    return 0.0;
  }
}

String formatBytes(double bytes) {
  const sizes = ['B', 'KB', 'MB', 'GB'];
  // * Default
  var i = 0;
  var result = bytes.toDouble();
  // * Loop
  while (result > 1024 && i < sizes.length - 1) {
    // * Init Result
    result /= 1024;
    // * Increase Index
    i++;
  }
  return '${result.toStringAsFixed(2)} ${sizes[i]}';
}

String format12Hour(String? time) {
  DateTime dateTime = DateFormat('HH:mm:ss').parse(time!);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

String formatDuration(String? durationString) {
  // * Parse the input duration string
  List<String> parts = durationString!.split(':');
  Duration duration = Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(parts[2]),
  );

  // *Format the duration
  if (duration.inHours > 0) {
    return '${duration.inHours} ${duration.inHours == 1 ? 'hour' : 'hours'}';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes} ${duration.inMinutes == 1 ? 'minute' : 'minutes'}';
  } else {
    return '${duration.inSeconds} ${duration.inSeconds == 1 ? 'second' : 'seconds'}';
  }
}

String getGender({required Gender value}) {
  final map = {Gender.male: 'male', Gender.female: 'female'};
  return map[value] ?? '';
}

Widget getMenuRoute({required Menu value}) {
  final map = {
    Menu.university: const UniversityPage(),
    Menu.career: const CareerPage(),
    Menu.forum: const ForumPage(),
    Menu.events: const EventPage(),
    Menu.guides: const GuidesPage(),
    Menu.collegeQuiz: isSignedIn() ? const CareerQuizPage() : const PreSignUpPage(),
    Menu.scholarships: const ScholarshipsPage(),
    Menu.financialAid: const FinancialAidPage(),
    Menu.compareColleges: const CompareCollegePage(),
  };
  return map[value]!;
}

IconData getIcon({required Gender value}) {
  final map = {
    Gender.male: Icons.male,
    Gender.female: Icons.female,
  };
  return map[value]!;
}

String getIconMenu({required Menu value}) {
  final map = {
    Menu.university: Assets.iconBuilding,
    Menu.career: Assets.iconCareer,
    Menu.forum: Assets.iconForum,
    Menu.events: Assets.iconEvent,
    Menu.guides: Assets.iconGuides,
    Menu.collegeQuiz: Assets.iconQuiz,
    Menu.scholarships: Assets.iconScholarship,
    Menu.financialAid: Assets.iconMoney,
    Menu.compareColleges: Assets.iconCompareCollege,
  };
  return map[value]!;
}

String getMenuTitle({required Menu value}) {
  final map = {
    Menu.university: LocaleKeys.university,
    Menu.career: LocaleKeys.career,
    Menu.forum: LocaleKeys.forum,
    Menu.events: LocaleKeys.events,
    Menu.guides: LocaleKeys.guides,
    Menu.collegeQuiz: LocaleKeys.college_quiz,
    Menu.scholarships: LocaleKeys.scholarships,
    Menu.financialAid: LocaleKeys.financial_aid,
    Menu.compareColleges: LocaleKeys.compare_colleges,
  };
  return map[value]!;
}

String getUniversityFilterMenuTitle({required UniversityFilterMenu value}) {
  final map = {
    UniversityFilterMenu.major: LocaleKeys.major,
    UniversityFilterMenu.type: LocaleKeys.types,
    UniversityFilterMenu.location: LocaleKeys.location,
    UniversityFilterMenu.degree: LocaleKeys.degree,
  };
  return map[value]!;
}

String getEventFilterMenuTitle(EventFilterMenu value) {
  switch (value) {
    case EventFilterMenu.upcoming:
      return 'Upcoming';
    case EventFilterMenu.past:
      return 'Past';
    case EventFilterMenu.favorite:
      return 'Favorite';
    default:
      return '';
  }
}

// Future<void> screenshotTransaction({
//   required Widget longWidget,
// }) async {
//   // * Init
//   // * Init Screenshot Controller
//   final screenshotController = ScreenshotController();
//   // * Show Progress Dialog
//   final progressDialog = ProgressDialog()..show();
//   // * Get Directory Path
//   final directory = await getApplicationDocumentsDirectory();
//   // * Init File Path
//   final filePath = File('${directory.path}/images').path;
//   // * Init File Name
//   final fileName = 'ticket-${DateFormat('yyyy-MM-dd').format(DateTime.now())}.png';
//   // * Take an Screenshot
//   final screenshot = await screenshotController.captureFromWidget(longWidget);
//   // * Init Temp File
//   final tempFile = await File('$filePath/$fileName').create(recursive: true );

//   await tempFile.writeAsBytes(screenshot);

//   await Gal.putImage(tempFile.path, album: 'Rith Mony');
//   // * Delete Screenshot File To Prevent From Out of Storage (Because It's Already Saved Into Gallery)
//   tempFile.delete();
//   // * Dismiss Progress Dialog
//   progressDialog.dismiss();
//   // * Show Snack Bar
//   if (getCurrentContext.mounted) {
//     getCurrentContext.showSuccessSnackBar(msg: tr(LocaleKeys.transaction_has_been_saved_to_your_gallery));
//   }   // // * If Screenshot Not Equal Null
// if (screenshot != null) {
//   // * Init Screenshot File
//   final file = File(screenshot);
//   // * Put Screenshot In Gallery
//   await Gal.putImage(file.path, album: 'Rith Mony');`
//   // * Delete Screenshot File To Prevent From Out of Storage (Because It's Already Saved Into Gallery)
//   file.delete();
//   // * Dismiss Progress Dialog
//   progressDialog.dismiss();
//   // * Show Snack Bar
//   if (getCurrentContext.mounted) {
//     getCurrentContext.showSuccessSnackBar(msg: 'Transaction has been saved to your gallery');
//   }
// }
// // * If Screenshot Equal Null
// else {
//   // * Dismiss Progress Dialog
//   progressDialog.dismiss();
//   // ! Show Snack Bar
//   if (getCurrentContext.mounted) getCurrentContext.showInfoSnackBar(msg: 'Failed to save transaction');
// }
// }
