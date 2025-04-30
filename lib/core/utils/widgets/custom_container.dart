import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.text,
      this.image,
      this.color,
      this.name,
      this.gender,
      this.area,
      this.age,
      this.phone});
  final Image? image;
  final String? text;
  final Color? color;
  final String? name;
  final String? gender;
  final String? area;
  final int? age;
  final int? phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.current.white,
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              text!,
              style: Styles.textStyleMedium.copyWith(
                  fontSize: responsiveFonts(context, fontSize: Get.mediaQuery.size.width * 0.035),
                  color: color),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          10.horizontalSpace,
          image ?? const SizedBox(),
        ],
      ),
    );
  }
}
