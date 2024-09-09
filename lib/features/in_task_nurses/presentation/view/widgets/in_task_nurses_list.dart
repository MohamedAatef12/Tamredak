import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/in_task_nurses/presentation/controllers/in_task_controller.dart';
class InTaskList extends StatelessWidget {
  const InTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final InTaskController controller = Get.put(InTaskController());
    controller.fetchUnAvailableNurses();
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width *0.92,
      decoration: BoxDecoration(
          color: AppColors.current.lightPurpleBackground,
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
                const SizedBox(width: 15,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: AppColors.current.white,borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: AppIcons.search,
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                // Show circular indicator when loading
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.unAvailableNursesList.isEmpty) {
                return  Center(
                    child: Column(

                      children: [
                        SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
                        const Image(image: AssetImage('assets/images/nodata.png')),
                      ],
                    )
                );
              }
              return
                SizedBox(
                  height: Get.mediaQuery.size.height * 0.539,
                  width: Get.mediaQuery.size.width * 0.85,
                  // Set ListView height
                  child: ListView.separated(
                    itemCount: controller.unAvailableNursesList.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 15,
                    ), // Set the number of items
                    itemBuilder: (context, index) {
                      final nurse = controller.unAvailableNursesList[index];
                      final nurseId= nurse['id'];
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
                        color: AppColors.current.purpleButtons,
                        one: true,
                        button1:  CustomAppButton(text: 'End Task',
                          textFont: 12,
                          onTap: (){
                          controller.setNurseAvailable(nurseId);
                          },
                          height: 30,
                          width: 20,),
                      );
                    },
                  ),
                );
            }
            )
          ],
        ),
      ),
    );
  }
}
