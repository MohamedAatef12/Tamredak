import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/scale_factors.dart';
import 'package:tamredak/features/mobile_layout/login/presentation/views/login_screen.dart';


import 'animations.dart';


class DesktopSplashBody extends StatefulWidget {
  const DesktopSplashBody({super.key});

  @override
  State<DesktopSplashBody> createState() => _DesktopSplashBodyState();
}

class _DesktopSplashBodyState extends State<DesktopSplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {

    super.initState();
    initSlidingAnimation();
    initDelay();
  }

  @override
  void dispose() {

    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image(
            image: const AssetImage(
              Assets.logo,
            ),
            width: MediaQuery.of(context).size.width *
                (getScaleFactorLogo(context).clamp(.5, 1.0) * 0.4),
                height: 300.r,
          )),
          SlidingAnimation(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initDelay() {
    Future.delayed(const Duration(seconds: 3), () {

    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
