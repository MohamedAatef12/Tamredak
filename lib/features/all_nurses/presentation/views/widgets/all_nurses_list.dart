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
import 'package:tamredak/features/all_nurses/presentation/controllers/all_nurses_controller.dart';
import 'package:tamredak/features/edit_profile/presentation/views/edit_profile_screen.dart';

class AllNursesList extends StatelessWidget {
  const AllNursesList({super.key});

  @override
  Widget build(BuildContext context) {
    final AllNursesController controller = Get.put(AllNursesController());
    controller.fetchNurses();
    return Container(
      width: MediaQuery.of(context).size.width * 0.8.r,
      decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: const CustomTextFormField(
                    label: 'Search',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.07.r,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.current.white,
                        borderRadius: BorderRadius.circular(10).r),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: AppIcons.search,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Obx(() {
              if (controller.nursesList.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2.r,
                    ),
                    const Image(image: AssetImage('assets/images/nodata.png')),
                  ],
                ));
              } else {
                return SizedBox(
                  height: Get.mediaQuery.size.height * 0.45.r,
                  width: Get.mediaQuery.size.width * 0.85.r,
                  // Set ListView height
                  child: ListView.separated(
                    itemCount: controller.nursesList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ), // Set the number of items
                    itemBuilder: (context, index) {
                      final nurse = controller.nursesList[index];
                      final nurseId = nurse['id'];
                      return CustomNursesCard(
                        name: nurse['first name'] + nurse["last name"],
                        image: const Image(
                          image: AssetImage(
                            Assets.noPhoto,
                          ),
                        ),
                        phone: nurse['phone number'],
                        age: nurse['age'],
                        area: nurse['area'],
                        gender: nurse['gender'],
                        time: nurse['time'],
                        one: false,
                        button1: CustomAppButton(
                          text: 'تعديل بياناته',
                          textFont: 12.spMin,
                          height: 10.r,
                          width: 20.r,
                          onTap: () {
                            Get.to(EditProfileScreen(nurse: nurse));
                          },
                        ),
                        button2: CustomAppButton(
                            text: 'مسح',
                            textFont: 12.spMin,
                            height: 10.r,
                            width: 20.r,
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
                                    'Do you want to delete that nurse from the system ?',
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
                                // Keeps the dialog open until you manually dismiss it
                              ).show();
                            }),
                        color: AppColors.current.darkBlue,
                        color2: AppColors.current.red,
                      );
                    },
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
