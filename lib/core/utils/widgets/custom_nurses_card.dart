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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.current.white,
            borderRadius: BorderRadius.circular(20)),
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Name : $name',
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyleMedium.copyWith(
                          fontSize: responsiveFonts(context,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.025),
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    Text(
                      'Working Hours : $time ',
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyleMedium.copyWith(
                          fontSize: responsiveFonts(context,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.025),
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    Text(
                      'Area : $area ',
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyleMedium.copyWith(
                          fontSize: responsiveFonts(context,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.025),
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        textDirection: TextDirection.ltr,
                        'Age : $age',
                        style: Styles.textStyleMedium.copyWith(
                            fontSize: responsiveFonts(context,
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.025),
                            color: Colors.black),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Gender : $gender',
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyleMedium.copyWith(
                          fontSize: responsiveFonts(context,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.025),
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    Text(
                      'Phone Number : $phone',
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyleMedium.copyWith(
                          fontSize: responsiveFonts(context,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.025),
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            if (one == true)
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button1),
              ),
            if (one == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.045,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button1,
                  ),
                  10.horizontalSpace,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.045,
                    width: MediaQuery.of(context).size.width * 0.3,
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
