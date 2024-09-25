import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/login/presentation/views/controller/login_controller.dart';
class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the controller
    final controller = Get.put(LoginController());

    return Container(
      width: MediaQuery.sizeOf(context).width.r,
      height: MediaQuery.sizeOf(context).height*0.5.r,
      decoration: BoxDecoration(
        color: AppColors.current.blueBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                15.verticalSpace,
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
                // Username Text Field
                CustomTextFormField(
                  label: 'ادخل اسم المستخدم',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
                  controller: controller.usernameController, // bind controller
                ),
                15.verticalSpace,
                // Password Text Field
                CustomTextFormField(
                  label: 'ادخل الرقم السري',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
                  controller: controller.passwordController, // bind controller
                  obscureText: true, // Optional: obscure password input
                ),
                15.verticalSpace,
                Container(
                  height: 50.h,
                  width:350.w,
                  decoration: BoxDecoration(
                    color: AppColors.current.darkBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomAppButton(
                    text: 'تسجيل الدخول',
                    onTap: () {
                      // Call the method to check user access
                      controller.checkUserAccess();
                    },
                    height: 50.h, // Make sure height fits well
                    width:350.w,
                    textFont: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

