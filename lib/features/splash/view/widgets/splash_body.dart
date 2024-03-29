import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/login/views/login_screen.dart';
import 'package:tamredak/features/splash/view/widgets/animations.dart';
import '../../../../../core/utils/scale_factors.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    initDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
          const Spacer(
            flex: 5,
          ),
          Center(
            child: Image(
              image: const AssetImage(
                Assets.logo,
              ),
              width: MediaQuery.of(context).size.width *
                  (getScaleFactorLogo(context).clamp(.8, 1.5) * 0.3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SlidingAnimation(slidingAnimation: slidingAnimation),
          const Spacer(
            flex: 4,
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }

  void initDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const LoginScreen());
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
