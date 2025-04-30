import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/database/presentation/views/database_screen.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/views/add_nurse_screen.dart';
import 'package:tamredak/features/mobile_layout/all_nurses/presentation/views/all_nurses_screen.dart';
import 'package:tamredak/features/mobile_layout/availablel_nurses/presentation/views/view_available_nurses_screen.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/views/database_screen.dart';
import 'package:tamredak/features/mobile_layout/home/presentation/view/widgets/home_container.dart';
import 'package:tamredak/features/mobile_layout/in_task_nurses/presentation/view/in_task_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              text: 'Add New Nurse',
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
            text: 'Available Nurses',
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
            text: 'In Task Nurses',
            color: AppColors.current.purpleButtons,
            backcolor: AppColors.current.darkPurple.withOpacity(0.5),
            button: const InTaskScreen(),
          ),
          15.verticalSpace,
          HomeContainer(
            image: const Image(
              image: AssetImage(
                Assets.card4home,
              ),
            ),
            text: 'All Nurses',
            color: AppColors.current.blueButtons,
            backcolor: AppColors.current.darkBlue.withOpacity(0.5),
            button: const AllNursesScreen(),
          ),
          15.verticalSpace,
          HomeContainer(
            image: const Image(
              image: AssetImage(
                Assets.database,
              ),
            ),
            text: 'Database',
            color: AppColors.current.purpleText,
            backcolor: AppColors.current.purpleText.withOpacity(0.5),
            button: const DatabaseScreen(),
          ),
          15.verticalSpace,
        ],
      ),
    );
  }
}
