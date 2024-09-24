import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/availablel_nurses/presentation/views/widgets/view_available_nurses_body.dart';
import 'package:tamredak/features/bottom_bar/presentation/views/bottom_bar_screen.dart';

class ViewAllNursesScreen extends StatelessWidget {
  const ViewAllNursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.current.primary,
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
            child: Icon(Icons.arrow_back_ios, color: AppColors.current.white),
          ),
          onPressed: () {
            Get.off(const BottomBarScreen());
          },
        ),
      ),
      body: Container(
        color: AppColors.current.primary,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const ViewAllNursesScreenBody(),
      ),
    );
  }
}
