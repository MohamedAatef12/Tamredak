import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    label:'First Name',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter First Name'; }
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
                    label: 'Last Name',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Last Name";
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
                  type: TextInputType.number,
                  label: 'Phone Number',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                    return null;
                  },
                  maxLine: 1,
                  controller: controller.phoneNumber,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                child: CustomTextFormField(
                  label: 'Service Area',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Service Area";
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

                  label: 'Work Hours',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Work Hours";
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
                      label: 'Age',
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Age";
                        }
                        return null;
                      },
                      controller: controller.nurseAge,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.125,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    child: CustomTextFormField(
                      maxLine: 1,
                      label: 'Gender',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Gender";
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
                  text: 'Submit',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Only proceed if validation passes
                      controller.addNurse();
                      Get.back();
                      Get.snackbar('Successful process', 'The nurse has been added successfully');
                      controller.firstName.clear();
                      controller.lastName.clear();
                      controller.phoneNumber.clear();
                      controller.workArea.clear();
                      controller.workTime.clear();
                      controller.nurseAge.clear();
                      controller.nurseGender.clear();
                    } else {
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

