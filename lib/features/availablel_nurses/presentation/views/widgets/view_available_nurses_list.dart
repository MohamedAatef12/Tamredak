import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';
import 'package:tamredak/features/availablel_nurses/presentation/controllers/available_nurses_controller.dart';

class ViewAllNursesList extends StatelessWidget {
  const ViewAllNursesList({super.key});

  @override
  Widget build(BuildContext context) {
    final AvailableNursesController controller =
        Get.put(AvailableNursesController());
    controller.fetchAvailableNurses();
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
          color: AppColors.current.darkGreenBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                        EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .05,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.10,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: AppColors.current.white,
                        borderRadius: BorderRadius.circular(10)),
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
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                // Show circular indicator when loading
                return  Center(child: CircularProgressIndicator(color: AppColors.current.blueText,));
              }
              if (controller.availableNursesList.isEmpty) {
                return  Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
                      const Image(image: AssetImage('assets/images/nodata.png')),
                    ],
                  )
                );
              }
              return SizedBox(
                height: Get.mediaQuery.size.height * 0.57,
                width: Get.mediaQuery.size.width * 0.85, // Set ListView height
                child: ListView.separated(
                  itemCount: controller.availableNursesList.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ), // Set the number of items
                  itemBuilder: (context, index) {
                    final nurse = controller.availableNursesList[index];
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
                      one: true,
                      button1:  CustomAppButton(
                        onTap: (){controller.setNurseUnavailable(nurseId);
                          },
                        text: 'Send',
                        textFont: 12,
                        height: 30,
                        width: 20,
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
}
