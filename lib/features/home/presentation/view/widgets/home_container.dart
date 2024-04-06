import 'package:flutter/material.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7), // Shadow color
              spreadRadius: 0.5, // Spread radius// Blur radius
              offset: const Offset(-1, 4), // Offset from the Container
            ),
          ],
          color: AppColors.current.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        text!,
                        style: Styles.textStyleMedium.copyWith(
                            fontSize: responsiveFonts(context, fontSize: 11),
                            color: color),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(button);
                    },
                    child: Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color,
                          boxShadow: [
                            BoxShadow(
                              color: backcolor!, // Shadow color
                              spreadRadius: 0.5, // Spread radius// Blur radius
                              offset: const Offset(
                                  0, 2), // Offset from the Container
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          'اختر',
                          style: Styles.textStyleBold.copyWith(
                              fontSize: 14, color: AppColors.current.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: image ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
