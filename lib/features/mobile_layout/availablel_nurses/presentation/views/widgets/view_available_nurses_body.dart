import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/mobile_layout/availablel_nurses/presentation/views/widgets/view_available_nurses_list.dart';

class ViewAvailableNursesScreenBody extends StatelessWidget {
  const ViewAvailableNursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            CustomContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card2home,
                ),
              ),
              text: 'Available Nurses',
              color: AppColors.current.orangeText,
            ),
            10.verticalSpace,
            const ViewAvailableNursesList()
          ]),
    );
  }
}
