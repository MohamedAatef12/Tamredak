import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/widgets/custom_app_button.dart';
import 'package:tamredak/core/utils/widgets/custom_nurses_card.dart';

class ViewAllNursesList extends StatelessWidget {
  const ViewAllNursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
          color: AppColors.current.darkGreenBackground,
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
            SizedBox(
              height: Get.mediaQuery.size.height * 0.539,
              width: Get.mediaQuery.size.width * 0.85, // Set ListView height
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ), // Set the number of items
                itemBuilder: (context, index) {
                  return  CustomNursesCard(
                    name: 'mohamed',
                    image: const Image(
                      image: AssetImage(
                        Assets.noPhoto,
                      ),
                    ),
                    phone: "01025143723",
                    age: "20",
                    area:"napoli",
                    gender: "male",
                    one:true,
                    button1:  const CustomAppButton(text: 'Send', textFont: 12, height: 30,width: 20,),
                    color: AppColors.current.orangeButtons,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
