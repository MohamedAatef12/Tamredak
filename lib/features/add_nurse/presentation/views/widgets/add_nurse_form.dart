import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/add_nurse/presentation/controllers/add_nurse_controller.dart';
class AddNurseForm extends StatelessWidget {
  const AddNurseForm({super.key});
  @override

  Widget build(BuildContext context) {
    final AddNewNurseController controller = Get.put(AddNewNurseController());
    return Container(
      height:550.r,
      width: Get.mediaQuery.size.width*0.85.r,
      decoration: BoxDecoration(
        color: AppColors.current.greenBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0).r,
        child: GetBuilder<AddNewNurseController>(
          builder: (controller) {
            return Column(
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35.r,
                    child:  CustomTextFormField(
                      label: 'الأسم الأول',
                      maxLine:1 ,
                      controller: controller.firstName,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20).r,
                    ),
                  ),
                   const Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35.r,
                    child:  CustomTextFormField(
                      label: 'الأسم الأخير',
                      maxLine: 1,
                      controller: controller.lastName,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20).r,

                    ),
                  )
                ],),
                20.verticalSpace,
                 CustomTextFormField(
                  label: 'رقم الهاتف',
                  maxLine: 1,
                  controller: controller.phoneNumber,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
                20.verticalSpace,
                 CustomTextFormField(
                  label: 'منطقة الخدمة',
                  maxLine: 1,
                  controller: controller.workArea,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
               20.verticalSpace,
                 CustomTextFormField(
                  label: 'وقت العمل',
                  maxLine: 1,
                  controller: controller.workTime,
                  suffix: AppIcons.calendar,

                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
                20.verticalSpace,
                 Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35.r,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'العمر',
                        controller: controller.nurseAge,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35.r,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'النوع',
                        controller: controller.nurseGender,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                Container(
                  height: 50.h,
                  width:350.w,
                  decoration: BoxDecoration(
                    color: AppColors.current.darkGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomAppButton(text: 'تسجيل',
                      onTap: (){
                    controller.addNurse();
                    Get.back();
                    Get.snackbar('Successful process', 'The nurse had been added successfully');
                      },
                      height:
                      (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                      width:
                      (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
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
