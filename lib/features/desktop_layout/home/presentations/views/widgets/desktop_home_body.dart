import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/widgets/desktop_home_container.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .9,
        width: MediaQuery.sizeOf(context).width * .72,
        decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Welcome to Tamredak application',
              style: Styles.textStyleBold.copyWith(
                fontSize: responsiveFonts(context, fontSize: 20),
                color: AppColors.current.white
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DesktopHomeContainer(
                      image: Image(
                        height: MediaQuery.sizeOf(context).height*0.2,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          Assets.card1home,
                        ),
                      ),
                      text: 'Through this application you can add a new nurse to the system',
                      color: AppColors.current.greenButtons,
                      backcolor: AppColors.current.darkGreen.withOpacity(0.5),
                      test: true,
                    ),
                    15.verticalSpace,
                    DesktopHomeContainer(
                      image: Image(
                    height: MediaQuery.sizeOf(context).height*0.2,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          Assets.card4home,
                        ),
                      ),
                      text: 'You can also see all nurses in the system',
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
                        height: MediaQuery.sizeOf(context).height*0.2,
                        width: MediaQuery.sizeOf(context).width*0.13,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          Assets.card2home,
                        ),
                      ),
                      text: 'You can also see available nurses',
                      color: AppColors.current.orangeButtons,
                      backcolor: AppColors.current.darkOrange.withOpacity(0.5),
                      test: false,
                    ),
                    15.verticalSpace,
                    DesktopHomeContainer(
                      image: Image(
                        height: MediaQuery.sizeOf(context).height*0.2,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          Assets.card3home,
                        ),
                      ),
                      text: 'You can also see nurses who are on duty',
                      color: AppColors.current.purpleButtons,
                      backcolor: AppColors.current.darkPurple.withOpacity(0.5),
                      test: true,
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
