import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/add_nurse/presentation/views/add_nurse_screen.dart';
import 'package:tamredak/features/availablel_nurses/presentation/views/view_available_nurses_screen.dart';
import 'package:tamredak/features/home/presentation/view/widgets/home_container.dart';
import 'package:tamredak/features/in_task_nurses/presentation/view/in_task_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            15.verticalSpace,
            HomeContainer(
                image: const Image(
                  image: AssetImage(
                    Assets.card1home,
                  ),
                ),
                text: 'اضافة ممرض جديد للنظام',
                color: AppColors.current.greenButtons,
                backcolor: AppColors.current.darkGreen.withOpacity(0.5),
                button: const AddNurseScreen()),
            15.verticalSpace,
            HomeContainer(
              button: const ViewAllNursesScreen(),
              image: const Image(
                image: AssetImage(
                  Assets.card2home,
                ),
              ),
              text: 'رؤية الممرضين المتاحين',
              color: AppColors.current.orangeButtons,
              backcolor: AppColors.current.darkOrange.withOpacity(0.5),
            ),
            15.verticalSpace,
            HomeContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card3home,
                ),
              ),
              text: 'رؤية الممرضين الذين هم في مهمات',
              color: AppColors.current.purpleButtons,
              backcolor: AppColors.current.darkPurple.withOpacity(0.5),
              button: const InTaskScreen(),
            ),
            20.verticalSpace
          ],
        ),
      ),
    );
  }
}
