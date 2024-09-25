import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/features/add_nurse/presentation/views/add_nurse_screen.dart';
import 'package:tamredak/features/bottom_bar/presentation/views/bottom_bar_screen.dart';
import 'package:tamredak/features/splash/splash_screen.dart';

import 'features/availablel_nurses/presentation/views/view_available_nurses_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>
      GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          title: 'Tamredak',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.current.primary),
            useMaterial3: true,
          ),
          locale: const Locale('ar', 'EG'),
          fallbackLocale: const Locale('ar', 'EG'),
          home: child),
        child: const BottomBarScreen(),
    );
  }
}
