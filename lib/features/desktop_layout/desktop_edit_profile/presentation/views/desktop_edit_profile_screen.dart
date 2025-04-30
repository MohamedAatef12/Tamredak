import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/features/desktop_layout/desktop_edit_profile/presentation/views/widgets/desktop_edit_profile_body.dart';
class DesktopEditProfileScreen extends StatelessWidget {
  const DesktopEditProfileScreen({super.key, required this.nurse});
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.current.blueBackground,iconTheme: IconThemeData(color: AppColors.current.white),
  ),
      body:  DesktopEditProfileBody(nurse: nurse,),
    );
  }
}
