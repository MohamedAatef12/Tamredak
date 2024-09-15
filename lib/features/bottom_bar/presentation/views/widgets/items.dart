import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamredak/core/consts/icons.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';

List<PersistentBottomNavBarItem> itemsBottomBar() {
  return [
    PersistentBottomNavBarItem(
      icon: AppIcons.home,
      iconSize: 30,
      title: 'Home',
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: AppIcons.nurses,
      iconSize: 24,
      title: 'Nurses',
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: AppIcons.database,
      title: 'DataBase',
      iconSize: 24,
      activeColorPrimary: AppColors.current.darkPurple,
      activeColorSecondary: AppColors.current.white,
      textStyle: Styles.textStyleBold.copyWith(
        fontSize: 18,
      ),
    ),
  ];
}
