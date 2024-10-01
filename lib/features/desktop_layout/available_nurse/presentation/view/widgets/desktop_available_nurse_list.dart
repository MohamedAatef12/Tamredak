import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_desktop_nurse_card.dart';
import 'package:tamredak/features/mobile_layout/availablel_nurses/presentation/controllers/available_nurses_controller.dart';

class DesktopAvailableNurseList extends StatefulWidget {
  const DesktopAvailableNurseList({super.key});

  @override
  State<DesktopAvailableNurseList> createState() => _ViewAllNursesListState();
}

class _ViewAllNursesListState extends State<DesktopAvailableNurseList> {
  @override
  Widget build(BuildContext context) {
    final AvailableNursesController controller =
        Get.put(AvailableNursesController());
    controller.fetchAvailableNurses();
    return Container(
      width: MediaQuery.sizeOf(context).width * .5,
      height: MediaQuery.sizeOf(context).height * 0.75,
      decoration: BoxDecoration(
          color: AppColors.current.darkGreenBackground,
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
              if (controller.filteredNursesList.isEmpty) {
                return Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                    ),
                    const Image(image: AssetImage('assets/images/nodata.png')),
                  ],
                ));
              }
              return SizedBox(
                  width: MediaQuery.sizeOf(context).width * .45,
                  height: MediaQuery.sizeOf(context).height *
                      0.57, // Set ListView height
                  child: GridView.builder(
                    itemCount: controller.filteredNursesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing:
                          20.0, // Horizontal spacing between the grid items
                      mainAxisSpacing:
                          15.0, // Vertical spacing between the grid items
                    ),
                    itemBuilder: (context, index) {
                      final nurse = controller.filteredNursesList[index];
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
                            buildBottomBarSheet(context, nurseId);
                            // controller.setNurseUnavailable(nurseId);
                          },
                          text: 'اختيار الممرض',
                          textFont: 12,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          width: MediaQuery.sizeOf(context).width * 0.2,
                        ),
                        color: AppColors.current.orangeButtons,
                      );
                    },
                  ));
            })
          ],
        ),
      ),
    );
  }

  Future buildBottomBarSheet(BuildContext context, String nurseId) {
    final AvailableNursesController controller =
        Get.put(AvailableNursesController());

    return showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: AppColors.current.darkGreenBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تعبئة بيانات المريض',
                    style: TextStyle(
                      color: AppColors.current.orangeText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  CustomTextFormField(
                    controller: controller.nameController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال اسم المريض';
                      }
                      return null;
                    },
                    label: 'اسم المريض',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.phoneController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال رقم التواصل مع المريض';
                      }
                      return null;
                    },
                    label: 'رقم التواصل مع المريض',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.ageController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال عمر المريض';
                      }
                      return null;
                    },
                    label: 'عمر المريض',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.injuryController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال مما يعاني المريض';
                      }
                      return null;
                    },
                    label: 'مما يعاني المريض',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.areaController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال العنوان';
                      }
                      return null;
                    },
                    label: 'العنوان',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.genderController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الرجاء ادخال الجنس';
                      }
                      return null;
                    },
                    label: 'الجنس',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.sendNurseAvailable(nurseId);
                      await controller.setNurseUnavailable(nurseId);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.orangeButtons,
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'ارسال الطلب',
                      style: TextStyle(
                        color: AppColors.current.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(
      () {
        controller.nameController.clear();
        controller.phoneController.clear();
        controller.ageController.clear();
        controller.areaController.clear();
        controller.genderController.clear();
        controller.injuryController.clear();
      },
    );
  }
}
