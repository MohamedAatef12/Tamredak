import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/widgets/desktop_all_nurses_container.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/widgets/desktop_all_nurses_list.dart';
class DesktopAllNursesBody extends StatelessWidget {
  const DesktopAllNursesBody({super.key});

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
              DesktopAllNurseContainer(
                  text: 'All Nurses',
                  color: AppColors.current.blueText,
                  image: Assets.card4home),

            ],
          ),
        ));
  }
}
