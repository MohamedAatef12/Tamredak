import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/mobile_layout/availablel_nurses/presentation/controllers/available_nurses_controller.dart';

class ViewAvailableNursesList extends StatefulWidget {
  const ViewAvailableNursesList({super.key});

  @override
  State<ViewAvailableNursesList> createState() => _ViewAvailableNursesListState();
}

class _ViewAvailableNursesListState extends State<ViewAvailableNursesList> {
  @override
  Widget build(BuildContext context) {
    final AvailableNursesController controller =
        Get.put(AvailableNursesController());
    controller.fetchAvailableNurses();
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: Get.mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.darkGreenBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextFormField(
                label: 'Search',
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
                    const Image(image: AssetImage('assets/images/nodata.png')),
                    20.verticalSpace,
                    Text(
                      'No tasks found!',
                      style:
                      Styles.textStyleBold.copyWith(fontSize: 18.spMin),
                    ),
                  ],
                ));
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.filteredNursesList.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      15.verticalSpace, // Set the number of items
                  itemBuilder: (context, index) {
                    final nurse = controller.filteredNursesList[index];
                    final nurseId = nurse['id'];
                    return CustomNursesCard(
                      name: nurse['first name'] +' '+ nurse["last name"],
                      image:  const Image(image: AssetImage(Assets.noPhoto),),
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
                        text: 'Send Nurse',
                        textFont: MediaQuery.sizeOf(context).width * 0.03,
                        height: 30,
                        width: 150,
                      ),
                      color: AppColors.current.orangeButtons,
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Future buildBottomBarSheet(BuildContext context, String nurseId) {
    final AvailableNursesController controller =
        Get.put(AvailableNursesController());
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.current.darkGreenBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Patient Information',
                    style: TextStyle(
                      color: AppColors.current.orangeText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: controller.nameController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the patient name';
                      }
                      return null;
                    },
                    label: 'Patient Name',
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
                        return 'Please enter the patient phone number';
                      }
                      return null;
                    },
                    label: 'Patient Phone Number',
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
                        return 'Please enter the patient age';
                      }
                      return null;
                    },
                    label: 'Patient Age',
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
                        return 'Please enter the patient injury';
                      }
                      return null;
                    },
                    label: 'Patient Injury',
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
                        return 'Please enter the patient area';
                      }
                      return null;
                    },
                    label: 'Patient Area',
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
                        return 'Please enter the patient gender ';
                      }
                      return null;
                    },
                    label: 'Patient Gender',
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
                      'send',
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
