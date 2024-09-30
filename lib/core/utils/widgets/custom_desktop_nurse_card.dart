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
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                              responsiveFonts(context, fontSize: 11),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.08,
                          child: Text(
                            name!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 11),
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
                              responsiveFonts(context, fontSize: 11),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.05,
                          child: Text(
                            time!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize: responsiveFonts(context,
                                    fontSize: 11),
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
                              responsiveFonts(context, fontSize: 11),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.07,
                          child: Text(
                            area!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                responsiveFonts(context, fontSize: 11),
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
                              responsiveFonts(context, fontSize: 12),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.08,
                          child: Text(
                            age!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                responsiveFonts(context, fontSize: 11),
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
                              responsiveFonts(context, fontSize: 11),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.08,
                          child: Text(
                            gender!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                responsiveFonts(context, fontSize: 11),
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
                              responsiveFonts(context, fontSize: 11),
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.07,
                          child: Text(
                            phone!,
                            style: Styles.textStyleMedium.copyWith(
                                fontSize:
                                responsiveFonts(context, fontSize: 11),
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
                Image(
                  image: AssetImage(
                    image!,
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.065,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
        const Spacer(),
          if (one == true)
            Container(
                height: MediaQuery.sizeOf(context).height * 0.04,
                width: MediaQuery.sizeOf(context).width * 0.1,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: button1),
          const Spacer(),
          if (one == false)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button1,
                ),
                10.horizontalSpace,
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button2,
                ),
                const Spacer(),
              ],
            )
        ],
      ),
    );
  }
}
