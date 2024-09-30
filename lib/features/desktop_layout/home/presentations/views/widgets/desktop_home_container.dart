import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

class DesktopHomeContainer extends StatelessWidget {
  const DesktopHomeContainer(
      {super.key,
      this.image,
      this.text,
      this.color,
      this.backcolor,
      this.button,
      this.test});
  final Image? image;
  final String? text;
  final Color? color;
  final Color? backcolor;
  final Widget? button;
  final bool? test;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: test == true
            ? Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7), // Shadow color
                        spreadRadius: 0.5, // Spread radius// Blur radius
                        offset:
                            const Offset(-1, 4), // Offset from the Container
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              text!,
                              style: Styles.textStyleMedium.copyWith(
                                  fontSize: responsiveFonts(context,
                                      fontSize: 16.spMin),
                                  color: color),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        30.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.to(button);
                          },
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            width: MediaQuery.sizeOf(context).width * 0.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color,
                                boxShadow: [
                                  BoxShadow(
                                    color: backcolor!, // Shadow color
                                    spreadRadius:
                                        0.5.r, // Spread radius// Blur radius
                                    offset: const Offset(
                                        0, 2), // Offset from the Container
                                  ),
                                ]),
                            child: Center(
                              child: Text(
                                'اختر',
                                style: Styles.textStyleBold.copyWith(
                                    fontSize: 18.spMin,
                                    color: AppColors.current.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    10.horizontalSpace,
                    image ?? const SizedBox(),
                  ],
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7), // Shadow color
                        spreadRadius: 0.5, // Spread radius// Blur radius
                        offset:
                            const Offset(-1, 4), // Offset from the Container
                      ),
                    ],
                    color: AppColors.current.white,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              text!,
                              style: Styles.textStyleMedium.copyWith(
                                  fontSize: responsiveFonts(context,
                                      fontSize: 16.spMin),
                                  color: color),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        30.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.to(button);
                          },
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            width: MediaQuery.sizeOf(context).width * 0.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color,
                                boxShadow: [
                                  BoxShadow(
                                    color: backcolor!, // Shadow color
                                    spreadRadius:
                                        0.5.r, // Spread radius// Blur radius
                                    offset: const Offset(
                                        0, 2), // Offset from the Container
                                  ),
                                ]),
                            child: Center(
                              child: Text(
                                'اختر',
                                style: Styles.textStyleBold.copyWith(
                                    fontSize: 18.spMin,
                                    color: AppColors.current.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    10.horizontalSpace,
                    image ?? const SizedBox(),
                  ],
                ),
              ));
  }
}
