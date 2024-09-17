import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/scale_factors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/login/presentation/views/widgets/login_container_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoScaleFactor = getScaleFactorLogo(context).clamp(.8, 12.5) * 0.4;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.05, // Make height responsive
          ),
          Center(
            child: Text(
              'مرحبا',
              style: Styles.textStyleBold.copyWith(
                color: AppColors.current.blueText,
                fontSize: responsiveFonts(context, fontSize: 22), // Responsive font size
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.08), // Responsive padding
            child: Center(
              child: Image(
                image: const AssetImage(Assets.login),
                width: screenWidth * logoScaleFactor, // Responsive logo size
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Make spacing responsive
          const LoginContainer(),
        ],
      ),
    );
  }
}
