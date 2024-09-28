import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/login/presentations/views/widgets/desktop_login_left_side.dart';
import 'package:tamredak/features/desktop_layout/login/presentations/views/widgets/desktop_login_right_side.dart';

class DesktopLoginBody extends StatelessWidget {
  const DesktopLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DesktopLoginRightSide(),
        Spacer(),
        DesktopLoginLeftSide(),
        Spacer(),
      ],
    );
  }
}
