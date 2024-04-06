import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/availablel_nurses/presentation/views/widgets/view_available_nurses_list.dart';
class ViewAllNursesScreenBody extends StatelessWidget {
  const ViewAllNursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        const SizedBox(height: 20,),
      CustomContainer(
      image: const Image(
      image: AssetImage(
      Assets.card2home,
      ),
      ),
      text: 'رؤية جميع الممرضين المتاحين بالنظام',
      color: AppColors.current.orangeText,
      ),
      const SizedBox(height: 20,),
          const ViewAllNursesList()
      ]
      ),
    );
  }
}
