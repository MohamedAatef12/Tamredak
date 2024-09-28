import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';


import '../../../../../core/utils/styles.dart';

class SlidingAnimation extends StatefulWidget {
  const SlidingAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  State<SlidingAnimation> createState() => _SlidingAnimationState();
}

class _SlidingAnimationState extends State<SlidingAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: widget.slidingAnimation,
            child: Text(
              'تمريضك',
              textAlign: TextAlign.center,
              style: Styles.textStyleBold.copyWith(
                fontSize: responsiveFonts(context, fontSize: 35),
                color: AppColors.current.white
              ),
            ),
          );
        });
  }
}
