import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/mobile_layout/all_nurses/presentation/controllers/all_nurses_controller.dart';
import 'package:tamredak/features/mobile_layout/edit_profile/presentation/views/edit_profile_screen.dart';

class AllNursesList extends StatelessWidget {
  const AllNursesList({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the AllNursesController and fetch nurses on init
    final AllNursesController controller = Get.put(AllNursesController());

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: Get.mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.current.blueBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            // Search Bar UI
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: CustomTextFormField(
                    label: 'Search',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    onChange: (value) {
                      // Call the search function as user types
                      controller.searchNurses(value);
                    },
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            // List of Nurses
            Obx(() {
              if (controller.isLoading.value) {
                // Loading state
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Not loading state
                if (controller.nursesList.isEmpty) {
                  // No data state
                  return SizedBox(
                    height: Get.mediaQuery.size.height * 0.25,
                    child: const Center(
                      child:
                          Image(image: AssetImage('assets/images/nodata.png')),
                    ),
                  );
                } else {
                  // Nurses ListView
                  return Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.nursesList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        final nurse = controller.nursesList[index];
                        final nurseId = nurse['id'];
                        return CustomNursesCard(
                          name: nurse['first name'] + ' ' + nurse['last name'],
                          image:  const Image(image: AssetImage(Assets.noPhoto),),
                          phone: nurse['phone number'],
                          age: nurse['age'],
                          area: nurse['area'],
                          gender: nurse['gender'],
                          time: nurse['time'],
                          one: false,
                          button1: CustomAppButton(
                            text: 'Edit',
                            textFont: MediaQuery.sizeOf(context).width * 0.027,
                            height: 10.r,
                            width: 20.r,
                            onTap: () {
                              Get.to(EditProfileScreen(nurse: nurse));
                            },
                          ),
                          button2: CustomAppButton(
                            text: 'Delete',
                            textFont: MediaQuery.sizeOf(context).width * 0.027,
                            height: 10.r,
                            width: 20.r,
                            onTap: () {
                              AwesomeDialog(
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
                                    'Do you want to delete that nurse from the system?',
                                dismissOnTouchOutside: true,
                                dismissOnBackKeyPress: true,
                                btnOkOnPress: () {
                                  controller.deleteNurse(nurseId);
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
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
