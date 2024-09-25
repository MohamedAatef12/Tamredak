import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 30).r,
              child: Image(
                image: const AssetImage(
                  Assets.login,
                ),
                width:311.r,
                height: 250.r,
              ),
            ),
            30.verticalSpace,
           const LoginContainer(),
          ],
        ),
      ),
    );
  }
}
