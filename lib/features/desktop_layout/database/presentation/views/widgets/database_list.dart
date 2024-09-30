import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/controllers/database_controller.dart';

class DataBaseList extends StatelessWidget {
  const DataBaseList({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.put(DatabaseController());
    final TextEditingController searchController = TextEditingController();

    return Container(
      width: MediaQuery.sizeOf(context).width * .78,
      height: MediaQuery.sizeOf(context).height * 0.78,
      decoration: BoxDecoration(
        color: AppColors.current.lightPurpleBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 15.0,
          right: 15.0,
        ).r,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 43.r,
                      child: CustomTextFormField(
                        controller: searchController,
                        label: 'Search',
                        suffix: AppIcons.search,
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20)
                            .r,
                        onChange: (value) {
                          controller.searchTasks(value);
                        },
                      ),
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
                      padding: const EdgeInsets.all(5.0).r,
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
                return Column(
                  children: [
                    Container(
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: AppColors.current.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'عدد المعاملات الكلي : ${controller.filteredTasks.length}',
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
                    Row(
                      children: [
                        SizedBox(
                            width: 206.r,
                            child: Text(
                              'الاسم',
                              style: TextStyle(
                                fontSize: 20.spMin,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          width: 110.r,
                          child: Text(
                            'الهاتف',
                            style: TextStyle(
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60.r,
                          child: Text(
                            'العمر',
                            style: TextStyle(
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170.r,
                          child: Text(
                            'المنطقه',
                            style: TextStyle(
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.r,
                          child: Text(
                            'الاصابه',
                            style: TextStyle(
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.r,
                          child: Text(
                            'التاريخ',
                            style: TextStyle(
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.current.white,
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.filteredTasks.length,
                        separatorBuilder: (context, index) => Divider(
                          color: AppColors.current.white,
                          height: 15,
                        ),
                        itemBuilder: (context, index) {
                          final task = controller.filteredTasks[index];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 206.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${task['name']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16.spMin),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 110.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${task['phone']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16.spMin),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 60.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${task['age']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16.spMin),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${task['area']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${task['injury']}',
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16.spMin),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150.r,
                                color: AppColors.current.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task['date'].toString().substring(0, 19),
                                      style: Styles.textStyleBold
                                          .copyWith(fontSize: 16.spMin),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
