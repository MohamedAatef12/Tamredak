import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/availablel_nurses/presentation/controllers/available_nurses_controller.dart';
import 'package:tamredak/features/database/presentation/controllers/database_controller.dart';

class DataBaseList extends StatelessWidget {
  const DataBaseList({super.key});

  @override
  Widget build(BuildContext context) {

    final DatabaseController controller = Get.put(DatabaseController());
    DateTime date = DateTime(2024,9,1);
    return Obx(
        ()
        {
          if (controller.tasksList.isEmpty) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                    ),
                    Image(image: AssetImage('assets/images/nodata.png')),
                  ],
                ));
          }
          else{
            return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: AppColors.current.lightPurpleBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: CustomTextFormField(
                          label: 'Search',
                          suffix: AppIcons.search,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.current.white,
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${date.year}/${date.month}/${date.day}',
                                style:
                                Styles.textStyleBold.copyWith(fontSize: 14),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2100),
                                    initialDate: date,
                                  );
                                  if (newDate != null) {
                                    date = newDate;
                                    controller
                                        .update(); // Trigger the update via GetX
                                  }
                                },
                                icon: AppIcons.calendar,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<DatabaseController>(
                    builder: (controller) {
                      return SizedBox(
                        height: Get.mediaQuery.size.height * 0.539,
                        width: Get.mediaQuery.size.width * 0.85,
                        // Set ListView height
                        child: controller.tasksList.isEmpty
                            ? const Center(
                          child: Image(image: AssetImage(Assets.noData)),
                        )
                            : ListView.separated(
                          itemCount: controller.tasksList.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: 15,
                          ),
                          itemBuilder: (context, index) {
                            final task = controller.tasksList[index];
                            return Container(
                              height: MediaQuery.sizeOf(context).height *
                                  0.24,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.current.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${task['name']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Phone: ${task['phone']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Age: ${task['age']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Area: ${task['area']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Injury: ${task['injury']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Date: ${task['date']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );}

        });
  }
}
