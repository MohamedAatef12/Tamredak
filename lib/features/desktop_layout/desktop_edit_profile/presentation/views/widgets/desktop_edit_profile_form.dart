import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/controllers/desktop_add_nurse_controller.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/desktop_all_nurses_screen.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/widgets/desktop_all_nurses_list.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/controllers/add_nurse_controller.dart';
import 'package:tamredak/features/mobile_layout/all_nurses/presentation/controllers/all_nurses_controller.dart';
import 'package:tamredak/features/mobile_layout/edit_profile/presentation/controllers/edit_profile_controller.dart';
class DesktopEditProfileForm extends StatelessWidget {
  const DesktopEditProfileForm({super.key, required this.nurse});
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    EditProfileController controller =Get.put(EditProfileController());
    controller.loadNurseData(nurse['id']);
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: AppColors.current.purple,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                10.horizontalSpace,
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width*0.04,
                  backgroundColor: AppColors.current.white,
                  child: const Image(
                    image: AssetImage(
                      Assets.noPhoto,
                    ),
                  ),),
               15.horizontalSpace,
                Text(
                  'Edit Profile',
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: 11),
                      color: AppColors.current.veryDarkPurple),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  child: CustomTextFormField(
                    label: 'First Name',
                    controller: controller.firstName,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  child: CustomTextFormField(
                    label: 'Last Name',
                    controller: controller.lastName,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer(),
              ],
            ),
          15.verticalSpace,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.325,
              child: CustomTextFormField(
                label: 'Phone Number',
                controller: controller.phoneNumber,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                suffix: AppIcons.edit,
              ),
            ),
          15.verticalSpace,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.325,
              child: CustomTextFormField(
                label: 'Service Area',
                controller: controller.workArea,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                suffix: AppIcons.edit,
              ),
            ),
           15.verticalSpace,
            SizedBox( width: MediaQuery.sizeOf(context).width * 0.325,
              child: CustomTextFormField(
                label: 'Work Hours',
                suffix: AppIcons.calendar,
                controller: controller.workTime,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
         15.verticalSpace,
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  child: CustomTextFormField(
                    label: 'Age',
                    controller: controller.nurseAge,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  child: CustomTextFormField(
                    label: 'Gender',
                    controller: controller.nurseGender,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    suffix: AppIcons.edit,
                  ),
                ),
                const Spacer()
              ],
            ),
          const Spacer(),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.07,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                color: AppColors.current.veryDarkPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomAppButton(
                  text: 'save',
                  onTap: (){
                    controller.editProfileData(nurse['id']);
                    AllNursesController nursesController = Get.find<AllNursesController>();
                    nursesController.fetchNurses();
                   Get.back();
                  },
                  height: (MediaQuery.of(context).size.height* 0.15).clamp(25, 100),
                  width: (MediaQuery.of(context).size.width * 0.8).clamp(100, 800),
                  textFont: 14),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

