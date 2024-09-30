import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/scale_factors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/desktop_add_nurse_screen.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/view/desktop_available_nurses.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/widgets/desktop_home_container.dart';
import 'package:tamredak/features/desktop_layout/in%20task_nurse/presentation/views/desktop_in_task_screen.dart';
import 'package:tamredak/features/desktop_layout/left_bar/presentation/views/bottom_bar_screen.dart';
class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width*.9,
        height: MediaQuery.sizeOf(context).height*0.9,
        decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
            DesktopHomeContainer(
                image: const Image(
                  image: AssetImage(
                    Assets.card1home,
                  ),
                ),
                text: 'اضافة ممرض جديد للنظام',
                color: AppColors.current.greenButtons,
                backcolor: AppColors.current.darkGreen.withOpacity(0.5),
               test: true,
              button: const DesktopAddNurseScreen(),
            ),15.verticalSpace,
          DesktopHomeContainer(
            image: const Image(
              image: AssetImage(
                Assets.card4home,
              ),
            ),
            text: 'رؤية جميع الممرضين بالنظام',
            color: AppColors.current.blueText,
            backcolor: AppColors.current.darkBlue.withOpacity(0.5),
            test: false,
          )
          ],),
            15.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesktopHomeContainer(
                  image: const Image(
                    image: AssetImage(
                      Assets.card2home,
                    ),
                  ),
                  text: 'رؤية الممرضين المتاحين',
                  color: AppColors.current.orangeButtons,
                  backcolor: AppColors.current.darkOrange.withOpacity(0.5),
                  test: false,
                  button: const DesktopAvailableNurses(),
                ),15.verticalSpace,
                DesktopHomeContainer(
                  image: const Image(
                    image: AssetImage(
                      Assets.card3home,
                    ),
                  ),
                  text: 'رؤية الممرضين الذين هم في مهمات',
                  color: AppColors.current.purpleButtons,
                  backcolor: AppColors.current.darkPurple.withOpacity(0.5),
                  test: true,
                  button: DesktopInTaskScreen(),
                )
              ],),
          Column(children: [
            Image(
              image: const AssetImage(
                Assets.logo,
              ),
              width: MediaQuery.of(context).size.width *0.2,
              height: 120.r,
            ),15.verticalSpace,
            Text(
              'تمريضك',
              textAlign: TextAlign.center,
              style: Styles.textStyleBold.copyWith(
                  fontSize: responsiveFonts(context, fontSize: 20.spMin),
                  color: AppColors.current.white
              ),
            ),
          ],),

        ],),
      ),
    );
  }
}
