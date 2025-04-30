import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/controllers/database_controller.dart';

class DataBaseList extends StatefulWidget {
  const DataBaseList({super.key});

  @override
  State<DataBaseList> createState() => _DataBaseListState();
}

class _DataBaseListState extends State<DataBaseList> {
  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.put(DatabaseController());
    final TextEditingController searchController = TextEditingController();
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: Get.mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.lightPurpleBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.057,
                  width: Get.mediaQuery.size.width * 0.45,
                  child: CustomTextFormField(
                    controller: searchController,
                    label: 'Search',
                    maxLine: 1,
                    suffix: AppIcons.search,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onChange: (value) {
                      controller.searchTasks(value);
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.057,
                  width: Get.mediaQuery.size.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.current.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            '${controller.selectedDate.value.year}/${controller.selectedDate.value.month}/${controller.selectedDate.value.day}',
                            style: Styles.textStyleBold.copyWith(
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.025),
                          )),
                      IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2100),
                            initialDate: controller.selectedDate.value,
                          );
                          if (newDate != null) {
                            controller.updateSelectedDate(newDate);
                          }
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          size: MediaQuery.sizeOf(context).width * 0.04,
                          color: AppColors.current.text,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.resetDate(); // Reset to show all tasks
                        },
                        icon: Icon(Icons.close,
                            size: MediaQuery.sizeOf(context).width * 0.04,
                            color: AppColors.current.text),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            // Main content: Loading, No Data, or Task List
            Obx(() {
              if (controller.isLoading.value) {
                // Show loading spinner in the center of the screen
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredTasks.isEmpty) {
                // Show no data available when no tasks are found
                return Column(
                  children: [
                    70.verticalSpace,
                    const Image(image: AssetImage(Assets.noData)),
                    20.verticalSpace,
                    Text(
                      'No tasks found!',
                      style: Styles.textStyleBold.copyWith(
                        color: AppColors.current.white,
                          fontSize: MediaQuery.sizeOf(context).width * 0.025),
                    ),
                  ],
                );
              }
              // Show the list of tasks if available
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.filteredTasks.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  itemBuilder: (context, index) {
                    final task = controller.filteredTasks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.current.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Name : ${task['name']}',
                                textDirection: TextDirection.ltr,
                                style: Styles.textStyleBold
                                    .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                              5.verticalSpace,
                              Text(
                                'Phone Number : ${task['phone']}',
                                textDirection: TextDirection.ltr,
                                style:
                                    Styles.textStyleBold.copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                              5.verticalSpace,
                              Text(
                                'Age : ${task['age']}',
                                textDirection: TextDirection.ltr,
                                style: Styles.textStyleBold
                                    .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                              5.verticalSpace,
                              Text(
                                'Area : ${task['area']}',
                                textDirection: TextDirection.ltr,
                                style:
                                    Styles.textStyleBold.copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                              5.verticalSpace,
                              Text(
                                'Injury : ${task['injury']}',
                                textDirection: TextDirection.ltr,
                                style: Styles.textStyleBold
                                    .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                             5.verticalSpace,
                              Text(
                                'Date : ${task['date'].toString().substring(0, 19)}',
                                style: Styles.textStyleBold
                                    .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.03),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
            );
            }),
          ],
        ),
      ),
    );
  }
}
