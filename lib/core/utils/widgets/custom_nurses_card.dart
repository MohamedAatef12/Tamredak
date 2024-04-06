import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

class CustomNursesCard extends StatelessWidget {
  const CustomNursesCard(
      {super.key,
      this.image,
      this.name,
      this.gender,
      this.area,
      this.age,
      this.phone,
      this.color,
      this.button1,
      this.button2,
      this.one,
      this.color2});
  final Image? image;
  final String? name;
  final String? gender;
  final String? area;
  final String? age;
  final String? phone;
  final Color? color;
  final Widget? button1;
  final Widget? button2;
  final bool? one;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.current.white,
          borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.26,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'Name: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            name!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'Phone: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            phone!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'Area: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            area!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'Age: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            age!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'gender: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            gender!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                    thickness: 20,
                    color: AppColors.current.darkGreenBackground),
                SizedBox(
                    width: Get.mediaQuery.size.width * 0.3,
                    height: Get.mediaQuery.size.height * 0.15,
                    child: image ?? const SizedBox()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (one == true)
              Container(
                  height: Get.mediaQuery.size.height * 0.046,
                  width: Get.mediaQuery.size.width * 0.4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button1),
            if (one == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.mediaQuery.size.height * 0.046,
                    width: Get.mediaQuery.size.width * 0.35,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: Get.mediaQuery.size.height * 0.046,
                    width: Get.mediaQuery.size.width * 0.35,
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button2,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
