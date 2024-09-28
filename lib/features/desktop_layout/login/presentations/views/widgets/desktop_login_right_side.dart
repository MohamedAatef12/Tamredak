import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/desktop_layout/login/presentations/controllers/desktop_login_controller.dart';

class DesktopLoginRightSide extends StatelessWidget {
  const DesktopLoginRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    DesktopLoginController controller = Get.put(DesktopLoginController());
    return Container(
      decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      width: MediaQuery.sizeOf(context).width * 0.3,
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Image(
              image: const AssetImage(
                Assets.logo,
              ),
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
            Text(
              'تمريضك',
              style: Styles.textStyleBold.copyWith(
                color: AppColors.current.white,
                fontSize: responsiveFonts(context, fontSize: 20.spMin),
              ),
            ),
            15.verticalSpace,
            Text(
              'تسجيل الدخول',
              style: Styles.textStyleBold.copyWith(
                color: AppColors.current.white,
                fontSize: responsiveFonts(context, fontSize: 20.spMin),
              ),
            ),
            15.verticalSpace,
            CustomTextFormField(
              label: 'ادخل اسم المستخدم',
              controller: controller.usernameController,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
            ),
            15.verticalSpace,
            CustomTextFormField(
              label: 'ادخل الرقم السري',
              controller: controller.passwordController,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,

              obscureText: true, // Optional: obscure password input
            ),
            15.verticalSpace,
            Container(
              height: 50.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: AppColors.current.darkBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomAppButton(
                text: 'تسجيل الدخول',
                onTap: () {
                 controller.checkUserAccessDesktop();
                },
                height: 50.h, // Make sure height fits well
                width: 350.w,
                textFont: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
