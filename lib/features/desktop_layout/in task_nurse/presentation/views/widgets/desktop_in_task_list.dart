import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_desktop_nurse_card.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/mobile_layout/availablel_nurses/presentation/controllers/available_nurses_controller.dart';
import 'package:tamredak/features/mobile_layout/in_task_nurses/presentation/controllers/in_task_controller.dart';

class DesktopInTaskNurseList extends StatelessWidget {
  const DesktopInTaskNurseList({super.key});

  @override
  Widget build(BuildContext context) {
    final InTaskController controller =
    Get.put(InTaskController());
    controller.fetchUnAvailableNurses();
    return Container(
      width: MediaQuery
          .sizeOf(context)
          .width * .5,
      height: MediaQuery
          .sizeOf(context)
          .height * 0.75,
      decoration: BoxDecoration(
          color: AppColors.current.lightPurpleBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery
                  .sizeOf(context)
                  .width * .45,
              height: MediaQuery
                  .sizeOf(context)
                  .height * 0.07,
              child: CustomTextFormField(
                label: 'البحث',
                maxLine: 1,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
                onChange: (value) {
                  controller.searchNurses(value);
                },
              ),
            ),
            10.verticalSpace,
            Obx(() {
              if (controller.isLoading.value) {
                // Show circular indicator when loading
                return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.current.blueText,
                    ));
              }
              if (controller.unAvailableNursesList.isEmpty) {
                return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 0.15,
                        ),
                        const Image(
                            image: AssetImage('assets/images/nodata.png')),
                      ],
                    ));
              }
              return SizedBox(
                  width: MediaQuery
                      .sizeOf(context)
                      .width * .45,
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.57, // Set ListView height
                  child: GridView.builder(
                    itemCount: controller.unAvailableNursesList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // Number of columns
                      crossAxisSpacing: 20.0,
                      // Horizontal spacing between the grid items
                      mainAxisSpacing: 15.0, // Vertical spacing between the grid items
                    ),
                    itemBuilder: (context, index) {
                      final nurse = controller.unAvailableNursesList[index];
                      final nurseId = nurse['id'];
                      return CustomDesktopNursesCard(
                        name: nurse['first name'] + nurse["last name"],
                        image: Assets.noPhoto,
                        phone: nurse['phone number'],
                        age: nurse['age'],
                        area: nurse['area'],
                        gender: nurse['gender'],
                        time: nurse['time'],
                        one: true,
                        button1: CustomAppButton(
                          onTap: () {
                            controller.setNurseAvailable(nurseId);
                            // controller.setNurseUnavailable(nurseId);
                          },
                          text: 'انهاء المهمة',
                          textFont: 12,
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 0.07,
                          width: MediaQuery
                              .sizeOf(context)
                              .width * 0.2,
                        ),
                        color: AppColors.current.purpleButtons,
                      );
                    },
                  )
              );
            })
          ],
        ),
      ),
    );
  }
}
