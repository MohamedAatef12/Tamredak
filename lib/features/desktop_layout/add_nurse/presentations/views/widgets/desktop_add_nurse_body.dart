import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_container.dart';

class DesktopAddNurseBody extends StatelessWidget {
  const DesktopAddNurseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.sizeOf(context).width * .9,
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           DesktopAddNurseContainer(
             text: 'اضافة ممرض جديد للنظام',
             color: AppColors.current.lightGreenText,
             image: Assets.card1home),
          Column(
            children: [
              Image(
                fit: BoxFit.fill,
                image: const AssetImage(
                  Assets.logo,
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: 120.r,
              ),
              15.verticalSpace,
              Text(
                'تمريضك',
                textAlign: TextAlign.center,
                style: Styles.textStyleBold.copyWith(
                    fontSize: responsiveFonts(context, fontSize: 20.spMin),
                    color: AppColors.current.white),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
