import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/controllers/desktop_add_nurse_controller.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/controllers/add_nurse_controller.dart';
class DesktopAddNurseForm extends StatelessWidget {
  DesktopAddNurseForm({super.key});

  final _formKey = GlobalKey<FormState>(); // Key for form validation

  @override
  Widget build(BuildContext context) {
    DesktopAddNurseController controller = Get.put(DesktopAddNurseController());
    return Container(
      width: MediaQuery.sizeOf(context).width * .3,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: BoxDecoration(
          color: AppColors.current.greenBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.125,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  child: CustomTextFormField(
                    label:' الأسم الأول',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل الاسم الاول'; }
                      return null;
                    },
                    maxLine: 1,
                    controller: controller.firstName,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.13,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  child: CustomTextFormField(
                    label: 'الأسم الأخير',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "ادخل الاسم الأخير";
                      }
                      return null;
                    },
                    maxLine: 1,
                    controller: controller.lastName,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                )
              ]),
              20.verticalSpace,
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                child: CustomTextFormField(
                  label: 'رقم الهاتف',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "ادخل رقم الهاتف";
                    }
                    return null;
                  },
                  maxLine: 1,
                  controller: controller.phoneNumber,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                child: CustomTextFormField(
                  label: 'منطقة الخدمة',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "ادخل منطقة الخدمة";
                    }
                    return null;
                  },
                  maxLine: 1,
                  controller: controller.workArea,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                child: CustomTextFormField(
                  label: 'وقت العمل',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "ادخل وقت العمل";
                    }
                    return null;
                  },
                  maxLine: 1,
                  controller: controller.workTime,
                  suffix: AppIcons.calendar,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.125,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    child: CustomTextFormField(
                      maxLine: 1,
                      label: 'العمر',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "ادخل العمر";
                        }
                        return null;
                      },
                      controller: controller.nurseAge,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.125,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    child: CustomTextFormField(
                      maxLine: 1,
                      label: 'النوع',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "ادخل النوع";
                        }
                        return null;
                      },
                      controller: controller.nurseGender,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              Container(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.current.darkGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomAppButton(
                  text: 'تسجيل',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Only proceed if validation passes
                      controller.addNurse();
                      Get.back();
                      Get.snackbar('Successful process', 'The nurse has been added successfully');
                    } else {
                      // Show snackbar if validation fails
                      Get.snackbar('Error', 'Please fill in all fields correctly');
                    }
                  },
                  height: (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                  width: (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                  textFont: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

