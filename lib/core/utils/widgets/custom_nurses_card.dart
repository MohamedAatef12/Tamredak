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
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 10),
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
                    Row(
                      children: [
                        Text(
                          'الأسم: ',
                          style: Styles.textStyleMedium.copyWith(
                              fontSize:
                                  responsiveFonts(context, fontSize: 12),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.3,
                          child: Text(
                            name!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                    responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.003,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'وقت العمل: ',
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                responsiveFonts(context, fontSize: 12),
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            time!,
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
                     SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.003,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'المنطقة: ',
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.003,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'العمر: ',
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.003,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            'النوع: ',
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.003,
                    ),
                    Row(
                      children: [
                        Text(
                          'رقم الهاتف: ',
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
                  ],
                ),
                Spacer(),
                SizedBox(
                    width: Get.mediaQuery.size.width * 0.30,
                    height: Get.mediaQuery.size.height * 0.15,
                    child: image ?? const SizedBox()),
              ],
            ),
             SizedBox(
              height: MediaQuery.sizeOf(context).height*0.04,
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
                   SizedBox(
                    width: MediaQuery.sizeOf(context).width*0.04,
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
