import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/all_nurses/presentation/views/all_nurses_screen.dart';
import 'package:tamredak/features/edit_profile/presentation/views/widgets/edit_profile_body.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.current.blueBackground,
        title: Text(
          'تمريضك',
          style: Styles.textStyleBold
              .copyWith(color: AppColors.current.white, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.current.white,
            ),
          ),
          onPressed: () {
            Get.off(const AllNursesScreen());
          },
        ),
      ),
      body: Container(
          color: AppColors.current.blueBackground,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const EditProfileBody()),
    );
  }
}
