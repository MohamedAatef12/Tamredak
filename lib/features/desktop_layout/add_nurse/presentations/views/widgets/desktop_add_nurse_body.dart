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
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
           DesktopAddNurseContainer(
             text: 'اضافة ممرض جديد للنظام',
             color: AppColors.current.lightGreenText,
             image: Assets.card1home),
        ],
      ),
    ));
  }
}
