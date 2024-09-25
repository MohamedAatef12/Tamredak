import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/add_nurse/presentation/views/widgets/add_nurse_body.dart';
import 'package:tamredak/features/bottom_bar/presentation/views/bottom_bar_screen.dart';

class AddNurseScreen extends StatelessWidget {
  const AddNurseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.blueBackground,
      appBar: AppBar(
        backgroundColor: AppColors.current.blueBackground,
        title: Text(
          'تمريضك',
          style: Styles.textStyleBold
              .copyWith(color: AppColors.current.white, fontSize: 24.spMin),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.current.white,
            ),
          ),
          onPressed: () {
            Get.off(const BottomBarScreen());
          },
        ),
      ),
      body: const Center(child: AddNurseBody()),
    );
  }
}
