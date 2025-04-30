import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/desktop_edit_profile/presentation/views/widgets/desktop_edit_profile_container.dart';
class DesktopEditProfileBody extends StatelessWidget {
  const DesktopEditProfileBody({super.key, required this.nurse});
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            color: AppColors.current.blueBackground,
          ),
          child: DesktopEditProfileContainer(
            nurse: nurse,
              text: 'Edit Profile',
              color: AppColors.current.veryDarkPurple,
              image: Assets.editProfile),
        ));
  }
}
