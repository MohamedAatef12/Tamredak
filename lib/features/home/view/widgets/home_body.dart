import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/home/view/widgets/home_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                Assets.logo,
              ),
              width: 320,
              height:  MediaQuery.of(context).size.height*0.25
            ),

            HomeContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card1home,
                ),
              ),
              text: 'اضافة ممرض للنظام',
              color: AppColors.current.greenButtons,
              backcolor: AppColors.current.darkGreen.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            HomeContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card2home,
                ),
              ),
              text: 'رؤية الممرضين المتاحين',
              color: AppColors.current.orangeButtons,
              backcolor: AppColors.current.darkOrange.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            HomeContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card3home,
                ),
              ),
              text: 'رؤية الممرضين الذين هم في مهمات',
              color: AppColors.current.purpleButtons,
              backcolor: AppColors.current.darkPurple.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            HomeContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card4home,
                ),
              ),
              text: 'رؤية كل الممرضين بالنظام',
              color: AppColors.current.blueButtons,
              backcolor: AppColors.current.darkBlue.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
