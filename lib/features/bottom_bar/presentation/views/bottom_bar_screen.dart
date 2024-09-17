import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/features/bottom_bar/presentation/controller/bottom_bar_controller.dart';
import 'package:tamredak/features/bottom_bar/presentation/views/widgets/items.dart';

import 'widgets/screens.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BottomBarController(), permanent: true);
    return GetBuilder<BottomBarController>(
      init: BottomBarController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,
          screens: buildScreens(),
          items: itemsBottomBar(),
          navBarHeight: MediaQuery.sizeOf(context).height * 0.08,
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.current.blueBackground,
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          navBarStyle: NavBarStyle.style10,
          decoration: const NavBarDecoration(
          ),
        ),
      ),
    );
  }
}
