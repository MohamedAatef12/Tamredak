import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/widgets/desktop_home_container.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .9,
        width: MediaQuery.sizeOf(context).width * .8,
        decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesktopHomeContainer(
                  image: Image(
                    width: 140.r,
                    height: 140.r,
                    fit: BoxFit.cover,
                    image: const AssetImage(
                      Assets.card1home,
                    ),
                  ),
                  text: 'اضافة ممرض جديد للنظام',
                  color: AppColors.current.greenButtons,
                  backcolor: AppColors.current.darkGreen.withOpacity(0.5),
                  test: true,
                ),
                15.verticalSpace,
                DesktopHomeContainer(
                  image: Image(
                    width: 140.r,
                    height: 140.r,
                    fit: BoxFit.cover,
                    image: const AssetImage(
                      Assets.card4home,
                    ),
                  ),
                  text: 'رؤية جميع الممرضين بالنظام',
                  color: AppColors.current.blueText,
                  backcolor: AppColors.current.darkBlue.withOpacity(0.5),
                  test: false,
                )
              ],
            ),
            15.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesktopHomeContainer(
                  image: Image(
                    width: 140.r,
                    height: 140.r,
                    fit: BoxFit.cover,
                    image: const AssetImage(
                      Assets.card2home,
                    ),
                  ),
                  text: 'رؤية الممرضين المتاحين',
                  color: AppColors.current.orangeButtons,
                  backcolor: AppColors.current.darkOrange.withOpacity(0.5),
                  test: false,
                ),
                15.verticalSpace,
                DesktopHomeContainer(
                  image: Image(
                    width: 140.r,
                    height: 140.r,
                    fit: BoxFit.cover,
                    image: const AssetImage(
                      Assets.card3home,
                    ),
                  ),
                  text: 'رؤية الممرضين الذين هم في مهمات',
                  color: AppColors.current.purpleButtons,
                  backcolor: AppColors.current.darkPurple.withOpacity(0.5),
                  test: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
