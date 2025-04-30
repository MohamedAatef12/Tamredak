import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/controllers/add_nurse_controller.dart';
class AddNurseForm extends StatelessWidget {
  const AddNurseForm({super.key});
  @override

  Widget build(BuildContext context) {
    return Container(
      height:Get.mediaQuery.size.height*0.71,
      width: Get.mediaQuery.size.width*0.9,
      decoration: BoxDecoration(
        color: AppColors.current.greenBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
        child: GetBuilder<AddNewNurseController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    height: MediaQuery.sizeOf(context).height * 0.075,
                    child:  CustomTextFormField(
                      label: 'First Name',
                      maxLine:1 ,
                      controller: controller.firstName,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    ),
                  ),
                   const Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    height: MediaQuery.sizeOf(context).height * 0.075,
                    child:  CustomTextFormField(
                      label: 'Last Name',
                      maxLine: 1,
                      controller: controller.lastName,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                    ),
                  )
                ],),
                20.verticalSpace,
                 SizedBox(
                   height: MediaQuery.sizeOf(context).height * 0.075,
                   child: CustomTextFormField(
                    label: 'Phone Number',
                    maxLine: 1,
                    controller: controller.phoneNumber,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                   ),
                 ),
                20.verticalSpace,
                 SizedBox(
                   height: MediaQuery.sizeOf(context).height * 0.075,
                   child: CustomTextFormField(
                    label: 'Service Area',
                    maxLine: 1,
                    controller: controller.workArea,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                   ),
                 ),
               20.verticalSpace,
                 SizedBox(
                   height: MediaQuery.sizeOf(context).height * 0.075,
                   child: CustomTextFormField(
                    label: 'Work Time',
                    maxLine: 1,
                    controller: controller.workTime,
                    suffix: AppIcons.calendar,

                    contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                   ),
                 ),
                20.verticalSpace,
                 Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      height: MediaQuery.sizeOf(context).height * 0.075,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'Age',
                        controller: controller.nurseAge,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      height: MediaQuery.sizeOf(context).height * 0.075,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'Gender',
                        controller: controller.nurseGender,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Container(
                  height: (MediaQuery.of(context).size.height * 0.06),
                  width: (MediaQuery.of(context).size.width * 0.8),
                  decoration: BoxDecoration(
                    color: AppColors.current.darkGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomAppButton(text: 'Submit',
                      onTap: (){
                    controller.addNurse();
                    Get.back();
                    Get.snackbar('Successful process', 'The nurse had been added successfully');
                    controller.firstName.clear();
                    controller.lastName.clear();
                    controller.phoneNumber.clear();
                    controller.workArea.clear();
                    controller.workTime.clear();
                    controller.nurseAge.clear();
                    controller.nurseGender.clear();
                      },
                      height:
                      (MediaQuery.of(context).size.width * 0.15),
                      width:
                      (MediaQuery.of(context).size.width * 0.8),
                      textFont: 14),
                )
              ],
            );
          }
        ),
      ),
    );

  }
}
