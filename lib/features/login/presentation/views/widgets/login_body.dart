import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/login/presentation/views/widgets/login_container_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                10.verticalSpace,
                Text(
                  'مرحبا',
                  style: Styles.textStyleBold.copyWith(
                    color: AppColors.current.blueText,
                    fontSize: responsiveFonts(context, fontSize: 22.spMin),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 30).r,
                  child: Image(
                    image: const AssetImage(
                      Assets.login,
                    ),
                    width: 311.r,
                    height: 200.r,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: keyboardHeight == 0 ? 0 : keyboardHeight,
              left: 0,
              right: 0,
              child: const LoginContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
