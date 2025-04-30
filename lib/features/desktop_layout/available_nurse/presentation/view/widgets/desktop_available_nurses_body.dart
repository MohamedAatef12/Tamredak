import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/view/widgets/desktop_available_nurse_container.dart';

class DesktopAvailableNursesBody extends StatelessWidget {
  const DesktopAvailableNursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: AppColors.current.blueBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DesktopAvailableNurseContainer(
              text: 'Available Nurses',
              color: AppColors.current.orangeText,
              image: Assets.card2home),
        ],
      ),
    ));
  }
}
