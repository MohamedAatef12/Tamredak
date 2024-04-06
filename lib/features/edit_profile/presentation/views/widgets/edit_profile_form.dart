import 'package:flutter/material.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.74,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.purple,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
             Row(
              children: [
        Stack(
        alignment: AlignmentDirectional.topEnd,
          children: [
            CircleAvatar(
                radius: 65,
                backgroundColor: AppColors.current.white,
               child: const Image(
                 image: AssetImage(
                   Assets.noPhoto,
                 ),
               ),),
            CircleAvatar(
              radius: 19,
              backgroundColor: AppColors.current.primary,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.current.white,
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.camera_alt),
                )
              ),
            )
          ],
        ),
                const SizedBox(width: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                   'تعديل الصورة الشخصية',
                    style: Styles.textStyleMedium.copyWith(
                        fontSize: responsiveFonts(context, fontSize: 11),
                        color: AppColors.current.veryDarkPurple),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'الأسم الأول',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'الأسم الأخير',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'رقم الهاتف',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              suffix: AppIcons.edit,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'منطقة الخدمة',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              suffix: AppIcons.edit,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'وقت العمل',
              suffix: AppIcons.calendar,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'العمر',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'النوع',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: (MediaQuery.of(context).size.width * 0.15).clamp(25, 100),
              width: (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
              decoration: BoxDecoration(
                color: AppColors.current.veryDarkPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomAppButton(
                  text: 'حفظ',
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
