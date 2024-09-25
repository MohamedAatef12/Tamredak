import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      this.available,
      this.time,
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
  final String? time;
  final bool? available;
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
      width: MediaQuery.of(context).size.width * 0.85.r,
      height: 270.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الأسم: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            name!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'وقت العمل: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            time!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'المنطقة: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            area!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'العمر: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            age!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'النوع: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            gender!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'رقم الهاتف: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12.spMin),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.3,
                          child: Text(
                            phone!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 12.spMin),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                    width: Get.mediaQuery.size.width * 0.25.r,
                    height: Get.mediaQuery.size.height * 0.20.r,
                    child: image ?? const SizedBox()),
              ],
            ),
          ),
10.verticalSpace,
          if (one == true)
            Container(
                height: 40.r,
                width: 150.r,
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
                  height: 40.r,
                  width: 100.r,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button1,
                ),
                10.horizontalSpace,
                Container(
                  height: 40.r,
                  width: 100.r,
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
    );
  }
}
