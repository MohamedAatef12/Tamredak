import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/mobile_layout/login/presentation/views/widgets/login_container_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              // Fixed image taking 3/4 of the screen height
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: screenHeight * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مرحبا بك',
                      style: Styles.textStyleBold.copyWith(
                        color: AppColors.current.blueText,
                        fontSize: responsiveFonts(context, fontSize: 60.spMin),
                      ),
                    ),
                    10.verticalSpace,
                    const Image(
                      image: AssetImage(
                        Assets.login,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              // Login container positioned above the image
              Positioned(
                bottom: keyboardHeight == 0 ? 0 : keyboardHeight,
                left: 0,
                right: 0,
                child: const LoginContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
