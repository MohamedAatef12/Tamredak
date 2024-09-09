import 'package:flutter/material.dart';
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
      height: Get.mediaQuery.size.height*0.7,
      width: MediaQuery.of(context).size.width*0.95,
      decoration: BoxDecoration(
        color: AppColors.current.greenBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
        child: GetBuilder<AddNewNurseController>(
          builder: (controller) {
            return Column(
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.38,
                    child:  CustomTextFormField(
                      label: 'الأسم الأول',
                      maxLine:1 ,
                      controller: controller.firstName,
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    ),
                  ),
                   const Spacer(flex: 1,),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.38,
                    child:  CustomTextFormField(
                      label: 'الأسم الأخير',
                      maxLine: 1,
                      controller: controller.lastName,
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                    ),
                  )
                ],),
                const SizedBox(height: 15,),
                 CustomTextFormField(
                  label: 'رقم الهاتف',
                  maxLine: 1,
                  controller: controller.phoneNumber,
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
                const SizedBox(height: 15,),
                 CustomTextFormField(
                  label: 'منطقة الخدمة',
                  maxLine: 1,
                  controller: controller.workArea,
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
                const SizedBox(height: 15,),
                 CustomTextFormField(
                  label: 'وقت العمل',
                  maxLine: 1,
                  controller: controller.workTime,
                  suffix: AppIcons.calendar,

                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
                const SizedBox(height: 15,),
                 Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.38,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'العمر',
                        controller: controller.nurseAge,
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                    const Spacer(flex: 1,),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.38,
                      child:  CustomTextFormField(
                        maxLine: 1,
                        label: 'النوع',
                        controller: controller.nurseGender,
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                Container(
                  height:
                  (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                  width:
                  (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
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
