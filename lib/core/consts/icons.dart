import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';

abstract class AppIcons {
  static Icon home = Icon(
    Icons.home,
    color: AppColors.current.white,
  );
  static Icon database = Icon(
    Icons.storage,
    color: AppColors.current.white,
  );
  static Icon nurses = Icon(
    Icons.group,
    color: AppColors.current.white,
  );
  static Icon calendar = Icon(
    Icons.calendar_month,
    color: AppColors.current.darkGreen,
    size: 16,
  );
  static Icon search = Icon(
    Icons.search,
    color: AppColors.current.darkGreenBackground,
  );
  static Icon edit = Icon(
    Icons.edit_note,
    color: AppColors.current.veryDarkPurple,
  );
}
