import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_desktop_nurse_card.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/controllers/available_nurses_desktop_controller.dart';

class DesktopAvailableNurseList extends StatefulWidget {
  const DesktopAvailableNurseList({super.key});

  @override
  State<DesktopAvailableNurseList> createState() =>
      _DesktopAvailableNurseListState();
}

class _DesktopAvailableNurseListState extends State<DesktopAvailableNurseList> {
  @override
  Widget build(BuildContext context) {
    final AvailableNursesDesktopController controller =
    Get.put(AvailableNursesDesktopController());
    controller.fetchAvailableNurses();

    return Container(
      width: MediaQuery.sizeOf(context).width * .45,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        color: AppColors.current.darkGreenBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            // Search bar always visible
            Form(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .4,
                height: MediaQuery.sizeOf(context).height * 0.07,
                child: CustomTextFormField(
                  controller: controller.searchController,
                  label: 'Search',
                  maxLine: 1,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  onChange: (value) {
                    controller.searchNurses(value);
                  },
                ),
              ),
            ),
            10.verticalSpace,
            // Main content
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.current.blueText,
                    ),
                  );
                }

                if (controller.filteredNursesList.isEmpty) {
                  return Center(
                    child:  Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                        const Image(
                          image: AssetImage('assets/images/nodata.png'),
                        ),
                      ],
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: controller.filteredNursesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 20.0, // Horizontal spacing
                    mainAxisSpacing: 15.0, // Vertical spacing
                  ),
                  itemBuilder: (context, index) {
                    final nurse = controller.filteredNursesList[index];
                    final nurseId = nurse['id'];
                    return CustomDesktopNursesCard(
                      name: '${nurse['first name']} ${nurse["last name"]}',
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
                        },
                        text: 'Select',
                        textFont: 12,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                      ),
                      color: AppColors.current.orangeButtons,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future buildBottomBarSheet(BuildContext context, String nurseId) {
    final AvailableNursesDesktopController controller =
        Get.put(AvailableNursesDesktopController());

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
                    'Fill the form',
                    style: TextStyle(
                      color: AppColors.current.orangeText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(
                  height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.nameController,
                      label: 'Patient Name',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the patient name';
                        }
                        return null;
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.phoneController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the patient phone number';
                        }
                        return null;
                      },
                      label: 'Patient Phone Number',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.ageController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the patient age';
                        }
                        return null;
                      },
                      label: 'Patient Age',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.injuryController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the patient injury';
                        }
                        return null;
                      },
                      label: 'Injury',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.areaController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the Address';
                        }
                        return null;
                      },
                      label: 'Address',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.07,
                    child: CustomTextFormField(
                      controller: controller.genderController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter The Gender';
                        }
                        return null;
                      },
                      label: 'Gender',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if(controller.nameController.text.isEmpty ||
                          controller.phoneController.text.isEmpty ||
                          controller.ageController.text.isEmpty ||
                          controller.injuryController.text.isEmpty ||
                          controller.areaController.text.isEmpty ||
                          controller.genderController.text.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Please fill all fields',
                          backgroundColor: AppColors.current.red,
                          colorText: AppColors.current.white,
                        );
                        return;
                      }
                      else{
                        await controller.sendNurseAvailable(nurseId);
                        await controller.setNurseUnavailable(nurseId);
                        Get.back();
                        Get.snackbar(
                          'Success',
                          'Request sent successfully',
                          colorText: AppColors.current.white,
                        );
                        controller.nameController.clear();
                        controller.phoneController.clear();
                        controller.ageController.clear();
                        controller.injuryController.clear();
                        controller.areaController.clear();
                        controller.genderController.clear();

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.orangeButtons,
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Send Request',
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
    );
  }
}
