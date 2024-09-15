import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/all_nurses/presentation/views/all_nurses_screen.dart';
import 'package:tamredak/features/edit_profile/presentation/controllers/edit_profile_controller.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key, required this.nurse, });
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    EditProfileController controller =Get.put(EditProfileController());
    controller.loadNurseData(nurse['id']);
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.95,
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
                    controller: controller.firstName,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer(flex: 1,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'الأسم الأخير',
                    controller: controller.lastName,
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
              controller: controller.phoneNumber,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              suffix: AppIcons.edit,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'منطقة الخدمة',
              controller: controller.workArea,
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
              controller: controller.workTime,
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
                    controller: controller.nurseAge,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer(flex: 1,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'النوع',
                    controller: controller.nurseGender,
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
                  onTap: (){
                    controller.editProfileData(nurse['id']);
                    Get.off(const AllNursesScreen());
                  },
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
