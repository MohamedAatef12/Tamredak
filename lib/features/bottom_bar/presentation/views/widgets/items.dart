
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

List<PersistentBottomNavBarItem> itemsBottomBar() {
  return [
    PersistentBottomNavBarItem(
      icon: AppIcons.home,
      iconSize: 24.spMin,
      title: 'Home',
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18.spMin,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: AppIcons.nurses,
      iconSize: 24.spMin,
      title: 'Nurses',
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18.spMin,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: AppIcons.database,
      title: 'DataBase',
      iconSize: 24.spMin,
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18.spMin,
      ),
    ),
  ];
}
