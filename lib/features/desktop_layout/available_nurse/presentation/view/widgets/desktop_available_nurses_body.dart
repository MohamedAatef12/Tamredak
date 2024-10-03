import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/view/widgets/desktop_available_nurse_container.dart';

class DesktopAvailableNursesBody extends StatelessWidget {
  const DesktopAvailableNursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
                width: MediaQuery.sizeOf(context).width * .9,
                height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
            borderRadius: BorderRadius.circular(20)),
                child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DesktopAvailableNurseContainer(
                text: 'رؤية الممرضين المتاحين',
                color: AppColors.current.orangeText,
                image: Assets.card2home),
          ],
                ),
              ),
        ));
  }
}
