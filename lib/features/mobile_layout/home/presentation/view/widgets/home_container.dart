import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key,
      this.image,
      this.text,
      this.color,
      this.backcolor,
      this.button});
  final Image? image;
  final String? text;
  final Color? color;
  final Color? backcolor;
  final Widget? button;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7), // Shadow color
                spreadRadius: 0.3, // Spread radius// Blur radius
                offset: const Offset(-1, 4), // Offset from the Container
              ),
            ],
            color: AppColors.current.white,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                  text!,
                  style: Styles.textStyleMedium.copyWith(
                      fontSize: responsiveFonts(context, fontSize: Get.mediaQuery.size.width * 0.035),
                      color: color),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
                10.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.to(button);
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                        boxShadow: [
                          BoxShadow(
                            color: backcolor!, // Shadow color
                            spreadRadius: 0.5, // Spread radius// Blur radius
                            offset:
                                const Offset(0, 2), // Offset from the Container
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Click',
                        style: Styles.textStyleBold.copyWith(
                            fontSize: Get.mediaQuery.size.width*0.045, color: AppColors.current.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.22,
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: image ?? const SizedBox()),
          ],
        ),
      ),
    );
  }
}
