import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/controllers/database_controller.dart';

class DesktopDataBaseList extends StatelessWidget {
  const DesktopDataBaseList({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.put(DatabaseController());
    final TextEditingController searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAllTasks();
    });
    return Container(
      width: MediaQuery.sizeOf(context).width * .65,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        color: AppColors.current.lightPurpleBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.0.r,
          left: 15.0.r,
          right: 15.0.r,
        ).r,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomTextFormField(
                      controller: searchController,
                      label: 'Search',
                      maxLine: 1,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.r,
                        vertical: 7.5.r,
                      ).r,
                      onChange: (value) {
                        controller.searchTasks(value);
                      },
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    height: 43.r,
                    decoration: BoxDecoration(
                      color: AppColors.current.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                '${controller.selectedDate.value.year}/${controller.selectedDate.value.month}/${controller.selectedDate.value.day}',
                                style: Styles.textStyleBold
                                    .copyWith(fontSize: 14.spMin),
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
                            icon: AppIcons.calendar,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.resetDate(); // Reset to show all tasks
                            },
                            icon: Icon(Icons.close,
                                color: AppColors.current.text),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main content: Loading, No Data, or Task List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  // Show loading spinner in the center of the screen
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.filteredTasks.isEmpty) {
                  // Show no data available when no tasks are found
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage(Assets.noData)),
                        20.verticalSpace,
                        Text(
                          'No tasks found!',
                          style:
                              Styles.textStyleBold.copyWith(fontSize: 18.spMin),
                        ),
                      ],
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        decoration: BoxDecoration(
                          color: AppColors.current.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Number Of Transactions : ${controller.filteredTasks.length}',
                              style: Styles.textStyleBold
                                  .copyWith(fontSize: 16.spMin),
                            ),
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Divider(
                        color: AppColors.current.white,
                        height: 15,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await controller.fetchAllTasks();
                          },
                          child: ListView.separated(
                            itemCount: controller.filteredTasks.length,
                            separatorBuilder: (context, index) => Divider(
                              color: AppColors.current.white,
                              height: 15,
                            ),
                            itemBuilder: (context, index) {
                              final task = controller.filteredTasks[index];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nurse Name',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['nurseName']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                            color: AppColors.current.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Patient Name',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['name']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,color: AppColors.current.white,),

                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Patient Phone',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['phone']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                            color: AppColors.current.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['age']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                        color: AppColors.current.white
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Area',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['area']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                            color: AppColors.current.white
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Injury',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${task['injury']}',
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                            color: AppColors.current.white
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          color: AppColors.current.white,
                                          fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        task['date'].toString().substring(0, 19),
                                        style: Styles.textStyleBold
                                            .copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.01,
                                            color: AppColors.current.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
