import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';

import 'view/widgets/splash_body.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.current.primary,
        child: const SplashBody());
  }
}
