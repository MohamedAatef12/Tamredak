import 'package:flutter/material.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
class AddNurseForm extends StatelessWidget {
  const AddNurseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.65,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: AppColors.current.greenBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
        child: Column(
          children: [
            Row(children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.38,
                child: const CustomTextFormField(
                  label: 'الأسم الأول',
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                ),
              ),
              const SizedBox(width: 15,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.38,
                child: const CustomTextFormField(
                  label: 'الأسم الأخير',
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                ),
              )
            ],),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              label: 'رقم الهاتف',
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            ),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              label: 'منطقة الخدمة',
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            ),
            const SizedBox(height: 15,),
             CustomTextFormField(
              label: 'وقت العمل',
              suffix: AppIcons.calendar,

              contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            ),
            const SizedBox(height: 15,),
             Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: const CustomTextFormField(
                    label: 'العمر',
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  ),
                ),
                const SizedBox(width: 15,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: const CustomTextFormField(
                    label: 'النوع',
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
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
                  height:
                  (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
                  width:
                  (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                  textFont: 14),
            )
          ],
        ),
      ),
    );
  }
}
