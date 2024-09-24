import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/all_nurses/presentation/controllers/all_nurses_controller.dart';
import 'package:tamredak/features/edit_profile/presentation/views/edit_profile_screen.dart';

class AllNursesList extends StatelessWidget {
  const AllNursesList({super.key});

  @override
  Widget build(BuildContext context) {
    final AllNursesController controller = Get.put(AllNursesController());

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: AppColors.current.blueBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomTextFormField(
                    label: 'Search',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    onChange: (value) {
                      controller.searchNurses(value);
                    },
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.current.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: AppIcons.search,
                      onPressed: () {
                        // Optionally, you can trigger search here if needed
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Obx(() {
              final nurses = controller.nursesList;

              if (nurses.isEmpty) {
                // Check if the nurses list is empty after the search
                return Center(
                  child: Image.asset('assets/images/nodata.png'),
                );
              } else {
                return SizedBox(
                  height: Get.mediaQuery.size.height * 0.539,
                  width: Get.mediaQuery.size.width * 0.85,
                  child: ListView.separated(
                    itemCount: nurses.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final nurse = nurses[index];
                      final nurseId = nurse['id'];
                      return CustomNursesCard(
                        name: nurse['first name'] + ' ' + nurse['last name'],
                        image: const Image(image: AssetImage(Assets.noPhoto)),
                        phone: nurse['phone number'],
                        age: nurse['age'],
                        area: nurse['area'],
                        gender: nurse['gender'],
                        time: nurse['time'],
                        one: false,
                        button1: CustomAppButton(
                          text: 'Edit Profile',
                          textFont: 12,
                          height: 30,
                          width: 20,
                          onTap: () {
                            Get.to(EditProfileScreen(nurse: nurse));
                          },
                        ),
                        button2: CustomAppButton(
                          text: 'Delete',
                          textFont: 12,
                          height: 30,
                          width: 20,
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              customHeader: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.cover,
                              ),
                              buttonsBorderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
            }),
          ],
        ),
      ),
    );
  }
}
