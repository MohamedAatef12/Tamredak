import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/desktop_home_screen.dart';
import 'package:tamredak/features/mobile_layout/home/presentation/view/home_screen.dart';
import 'package:window_size/window_size.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    // Set the initial window size for Windows
    setWindowMinSize(const Size(1700, 900));
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1000, 700),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            title: 'Tamredak',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            locale: const Locale('ar', 'EG'),
            fallbackLocale: const Locale('ar', 'EG'),
            home:  (Platform.isAndroid)
              ? const HomeScreen()
                : const DesktopHomePage(),

        ));
  }
}
