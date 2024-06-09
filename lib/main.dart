import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

Future<void> main() async {
  // * Ensure Widget Initialized
  WidgetsFlutterBinding.ensureInitialized();

  // * Initialize Trusted Certificate Https
  HttpOverrides.global = MyHttpOverrides();

  // * Initialize One Signal
  // initOneSignalPlatformState();

  // * Initialize Flavor
  Flavor.instance.init(flavor: QAFlavor());

  // * Ensure App Preference Initialized
  await AppPreference.ensureInitialized();

  // * Ensure Easy Localization Initialized
  await EasyLocalization.ensureInitialized();

  // * Show Status Bar After Splash Screen
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  // * Locked Phone Screen to Portrait Only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // * Run App
  runApp(
    EasyLocalization(
      path: Assets.translationPath,
      supportedLocales: LanguageManager.supportedLanguage,
      startLocale: LanguageManager.defaultLanguage,
      fallbackLocale: LanguageManager.defaultLanguage,
      child: DevicePreview(
        // enabled: await getDeviceName() == debugDeviceName,
        enabled: true,
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => InternetCubit()),
            BlocProvider(create: (_) => UniversityBloc()),
          ],
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // * Modals
  final _noInternetDialog = NoInternetDialog();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Capstone II',
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: primaryColor,
          primarySwatch: getPrimaryMaterialColor(primaryColor),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: appBarTheme,
          snackBarTheme: snackBarTheme,
          inputDecorationTheme: textFormFieldTheme,
          elevatedButtonTheme: elevatedButtonTheme,
          fontFamily: context.getDefaultLanguage ? 'Roboto' : 'KantumruyPro',
        ),
        home: BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            // * Internet Connect
            if (state is InternetConnected) {
              // * Dismiss No Internet Dialog
              if (_noInternetDialog.isShowing) _noInternetDialog.dismiss();
              // * Return
              return;
            }
            // * Internet Disconnect
            if (state is InternetDisconnect) {
              // * Show No Internet Dialog
              if (!_noInternetDialog.isShowing) _noInternetDialog.show();
              // * Return
              return;
            }
          },
          child: const DashboardPage(),
        ),
      ),
    );
  }
}
