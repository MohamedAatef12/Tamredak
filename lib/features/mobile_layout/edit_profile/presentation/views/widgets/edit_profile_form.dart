import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/mobile_layout/all_nurses/presentation/views/all_nurses_screen.dart';
import 'package:tamredak/features/mobile_layout/edit_profile/presentation/controllers/edit_profile_controller.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key, required this.nurse, });
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    EditProfileController controller =Get.put(EditProfileController());
    controller.loadNurseData(nurse['id']);
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: AppColors.current.purple,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.38,
                  child: CustomTextFormField(
                    label: 'First Name',
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
                    label: 'Last Name',
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
              label: 'Phone Number',
              controller: controller.phoneNumber,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              suffix: AppIcons.edit,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'Service Area',
              controller: controller.workArea,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              suffix: AppIcons.edit,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'Working Hours',
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
                    label: 'Age',
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
                    label: 'Gender',
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
              height: (MediaQuery.of(context).size.width * 0.12),
              width: (MediaQuery.of(context).size.width * 0.8),
              decoration: BoxDecoration(
                color: AppColors.current.veryDarkPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomAppButton(
                  text: 'Save',
                  onTap: (){
                    controller.editProfileData(nurse['id']);
                    Get.off(const AllNursesScreen());
                  },
                  height:
                      (MediaQuery.of(context).size.height * 0.1),
                  width:
                      (MediaQuery.of(context).size.width * 0.8),
                  textFont: 14),
            )
          ],
        ),
      ),
    );
  }
}
