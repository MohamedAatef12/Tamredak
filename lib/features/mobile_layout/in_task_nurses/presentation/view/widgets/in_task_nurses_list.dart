import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/mobile_layout/in_task_nurses/presentation/controllers/in_task_controller.dart';

class InTaskList extends StatelessWidget {
  const InTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final InTaskController controller = Get.put(InTaskController());
    controller.fetchUnAvailableNurses();

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: AppColors.current.lightPurpleBackground,
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
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: CustomTextFormField(
                    label: 'Search',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    onChange: (value) {
                      controller.searchNurses(value);
                    },
                  ),
                ),
              ],
            ),
           10.verticalSpace,
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.unAvailableNursesList.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Image(image: AssetImage('assets/images/nodata.png')),
                      SizedBox(height: 20),
                      Text('No data found'), // Optional message
                    ],
                  ),
                );
              }
              return SizedBox(
                height: Get.mediaQuery.size.height * 0.539,
                width: Get.mediaQuery.size.width * 0.85,
                child: ListView.separated(
                  itemCount: controller.unAvailableNursesList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final nurse = controller.unAvailableNursesList[index];
                    final nurseId = nurse['id'];
                    return CustomNursesCard(
                      name: '${nurse['first name']} ${nurse["last name"]}',
                      image: const Image(image: AssetImage(Assets.noPhoto),),
                      phone: nurse['phone number'],
                      age: nurse['age'],
                      area: nurse['area'],
                      gender: nurse['gender'],
                      time: nurse['time'],
                      color: AppColors.current.purpleButtons,
                      one: true,
                      button1: CustomAppButton(
                        text: 'End Task',
                        textFont: 12,
                        onTap: () {
                          controller.setNurseAvailable(nurseId);
                        },
                        height: 30,
                        width: 20,
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
