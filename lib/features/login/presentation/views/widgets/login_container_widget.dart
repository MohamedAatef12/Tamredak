import 'package:flutter/material.dart';
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

    return Expanded(
      child: SingleChildScrollView(
        physics: null,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.6,
          decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
              child: GetBuilder<LoginController>(
                builder: (controller) {
                  return Column(
                    children: [
                      Text(
                        'تمريضك',
                        style: Styles.textStyleBold.copyWith(
                          color: AppColors.current.white,
                          fontSize: responsiveFonts(context, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                      Text(
                        'تسجيل الدخول',
                        style: Styles.textStyleBold.copyWith(
                          color: AppColors.current.white,
                          fontSize: responsiveFonts(context, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                      // Username Text Field
                      CustomTextFormField(
                        label: 'ادخل اسم المستخدم',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        controller: controller.usernameController, // bind controller
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                      // Password Text Field
                      CustomTextFormField(
                        label: 'ادخل الرقم السري',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        controller: controller.passwordController, // bind controller
                        obscureText: true, // Optional: obscure password input
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                      Container(
                        height: (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                        width: (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
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
                          height: (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                          width: (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                          textFont: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
