import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_container.dart';

class DesktopAddNurseBody extends StatelessWidget {
  const DesktopAddNurseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: AppColors.current.blueBackground,
      ),
      child: DesktopAddNurseContainer(
          text: 'Add a new nurse to the system',
          color: AppColors.current.lightGreenText,
          image: Assets.card1home),
    ));
  }
}
