import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_desktop_nurse_card.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/controllers/available_nurses_desktop_controller.dart';
import 'package:tamredak/features/desktop_layout/desktop_edit_profile/presentation/views/desktop_edit_profile_screen.dart';
import 'package:tamredak/features/mobile_layout/all_nurses/presentation/controllers/all_nurses_controller.dart';

class DesktopAllNurseList extends StatelessWidget {
  const DesktopAllNurseList({super.key});

  @override
  Widget build(BuildContext context) {
    final AllNursesController allNursesController =
    Get.put(AllNursesController());
    allNursesController.fetchNurses();

    return Container(
      width: MediaQuery.sizeOf(context).width * .5,
      height: MediaQuery.sizeOf(context).height * 0.76,
      decoration: BoxDecoration(
          color: AppColors.current.lightBlueText,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              height: MediaQuery.sizeOf(context).height * 0.07,
              child: CustomTextFormField(
                label: 'Search',
                maxLine: 1,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20)
                    .r,
                onChange: (value) {
                  log(value.toString());
                  allNursesController.searchNurses(value);
                },
              ),
            ),
            10.verticalSpace,
            Obx(() {
                if (allNursesController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.current.white,
                    ),
                  );
                }
                if (allNursesController.nursesList.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                        const Image(
                          image: AssetImage('assets/images/nodata.png'),
                        ),
                        20.verticalSpace,
                        Text(
                          'No Information Found!',
                          style: TextStyle(
                            color: AppColors.current.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * .45,
                  height: MediaQuery.sizeOf(context).height * 0.57,
                  child: GridView.builder(
                    itemCount: allNursesController.nursesList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing:
                      20.0, // Horizontal spacing between grid items
                      mainAxisSpacing:
                      15.0, // Vertical spacing between grid items
                    ),
                    itemBuilder: (context, index) {
                      final nurse = allNursesController.nursesList[index];
                      final nurseId = nurse['id'];
                      return CustomDesktopNursesCard(
                        name: '${nurse['first name']} ${nurse["last name"]}',
                        image: Assets.noPhoto,
                        phone: nurse['phone number'],
                        age: nurse['age'],
                        area: nurse['area'],
                        gender: nurse['gender'],
                        time: nurse['time'],
                        one: false,
                        button1: CustomAppButton(
                          onTap: () {
                            Get.to( DesktopEditProfileScreen(nurse: nurse,));
                          },
                          text: 'Edit Profile',
                          textFont: 12,
                          height: MediaQuery.sizeOf(context).height * 0.009,
                          width: MediaQuery.sizeOf(context).width * 0.05,
                        ),
                        button2: CustomAppButton(
                          text: 'Delete',
                          textFont: 12.spMin,
                          height: MediaQuery.sizeOf(context).height * 0.009,
                          width: MediaQuery.sizeOf(context).width * 0.05,
                          onTap: () {
                            AwesomeDialog(
                              width: MediaQuery.sizeOf(context).width*0.5,
                              context: context,
                              customHeader: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.cover,
                              ),
                              buttonsBorderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              title: 'Delete Nurse',
                              desc:
                              '? Do you want to delete that nurse from the system',
                              dismissOnTouchOutside: true,
                              dismissOnBackKeyPress: true,
                              btnOkOnPress: () {
                                allNursesController.deleteNurse(nurseId);
                              },
                              btnOkColor: AppColors.current.red,
                              btnOkText: 'Yes Delete',
                              btnCancelText: 'Cancel',
                              btnCancelColor: AppColors.current.primary,
                              btnOkIcon: Icons.check_circle,
                              btnCancelIcon: Icons.cancel,
                              headerAnimationLoop: false,
                            ).show();
                          },
                        ),
                        color: AppColors.current.darkBlue,
                        color2: AppColors.current.red,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}