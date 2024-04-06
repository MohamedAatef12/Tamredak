import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/scale_factors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/bottom_bar/presentation/views/bottom_bar_screen.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Center(
          child: Column(
            children: [
              Image(
                image: const AssetImage(
                  Assets.logo,
                ),
                width: MediaQuery.of(context).size.width *
                    (getScaleFactorLogo(context).clamp(.8, 1.5) * 0.2),
              ),
              Text(
                'تمريضك',
                style: Styles.textStyleBold.copyWith(
                  color: AppColors.current.white,
                  fontSize: responsiveFonts(context, fontSize: 20),
                ),
              ),
              Text(
                'تسجيل الدخول',
                style: Styles.textStyleBold.copyWith(
                  color: AppColors.current.white,
                  fontSize: responsiveFonts(context, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                child: CustomTextFormField(
                  label: 'ادخل اسم المستخدم',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  label: 'ادخل الرقم السري',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height:
                (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                width:
                (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                decoration: BoxDecoration(
                  color: AppColors.current.darkBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomAppButton(text: 'تسجيل الدخول',
                    onTap: (){Get.to(const BottomBarScreen());},
                    height:
                    (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                    width:
                    (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                    textFont: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
