import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';

import 'view/widgets/desktop_splash_body.dart';

class DesktopSplashScreen extends StatelessWidget {
  const DesktopSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppColors.current.primary, child: const DesktopSplashBody()));
  }
}
