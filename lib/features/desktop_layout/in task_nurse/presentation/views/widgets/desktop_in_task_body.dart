import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/in%20task_nurse/presentation/views/widgets/desktop_in_task_nurse_container.dart';

class DesktopInTaskBody extends StatelessWidget {
  const DesktopInTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.sizeOf(context).width * .9,
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.primary,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DesktopInTaskNurseContainer(
              text: 'رؤية الممرضين الذين هم في مهام',
              color: AppColors.current.purpleText,
              image: Assets.card3home),
        ],
      ),
    ));
  }
}
