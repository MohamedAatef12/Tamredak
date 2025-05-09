import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_form.dart';

class DesktopAddNurseContainer extends StatelessWidget {
  const DesktopAddNurseContainer(
      {super.key,
      required this.text,
      required this.color,
      required this.image});
  final String text;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .6,
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
            color: AppColors.current.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        text,
                        maxLines: 3,
                        style: Styles.textStyleMedium.copyWith(
                            fontSize:
                                responsiveFonts(context, fontSize: 22.spMin),
                            color: color),
                        overflow: TextOverflow.ellipsis,
                      )),
                  40.verticalSpace,
                  Image(
                      image: AssetImage(image),
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.2)
                ],
              ),
              const Spacer(),
              DesktopAddNurseForm(),
            ],
          ),
        ),
      ),
    );
  }
}
