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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'مرحبا',
              style: Styles.textStyleBold.copyWith(
                color: AppColors.current.blueText,
                fontSize: responsiveFonts(context, fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Center(
              child: Image(
                image: const AssetImage(
                  Assets.login,
                ),
                width: MediaQuery.of(context).size.width *
                    (getScaleFactorLogo(context).clamp(.8, 12.5) * 0.4),
              ),
            ),
          ),
          const SizedBox(height: 30,),
         const LoginContainer(),
        ],
      ),
    );
  }
}
