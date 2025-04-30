import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

class CustomDesktopNursesCard extends StatelessWidget {
  const CustomDesktopNursesCard(
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
  final String? image;
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
      width: MediaQuery.sizeOf(context).width * .45,
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Name : $name',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  'Working Hours : $time',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  'Area : $area',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  'Age : $age',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  'Gender : $gender',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  'Phone Number : $phone',
                  textDirection: TextDirection.ltr,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.008),
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (one == true)
            Center(
              child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                  width: MediaQuery.sizeOf(context).width * 0.1,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button1),
            ),
  const Spacer(),
          if (one == false)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.09,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button1,
                  ),
                  10.horizontalSpace,
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.09,
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: button2,
                  ),

                ],
              ),
            )
        ],
      ),
    );
  }
}
