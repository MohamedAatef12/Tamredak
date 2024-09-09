import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/custom_text_form_field.dart';
import 'package:tamredak/core/utils/styles.dart';


class DataBaseList extends StatefulWidget {
  const DataBaseList({super.key});

  @override
  State<DataBaseList> createState() => _DataBaseListState();
}
DateTime date = DateTime(2024, 4, 6);
class _DataBaseListState extends State<DataBaseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.92,
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
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: CustomTextFormField(
                    label: 'Search',
                    suffix: AppIcons.search,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                          style: Styles.textStyleBold.copyWith(fontSize: 14),
                        ),
                        const Spacer(),
                        const VerticalDivider(
                          thickness: 0.5,
                          endIndent: 4,
                          indent: 4,
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2100),
                                  initialDate: date);
                              if(newDate==null) {
                                return;
                              } else {
                                setState(() {
                                date = newDate;
                              });
                              }
                            },
                            icon: AppIcons.calendar)
                      ],
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
                itemCount: 1,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ), // Set the number of items
                itemBuilder: (context, index) {
                  return const Image(image: AssetImage(Assets.noData));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
