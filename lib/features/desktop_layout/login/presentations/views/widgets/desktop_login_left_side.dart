import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';
class DesktopLoginLeftSide extends StatelessWidget {
  const DesktopLoginLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'مرحبا بك 👋',
          textAlign: TextAlign.center,
          style: Styles.textStyleBold.copyWith(
              fontSize: responsiveFonts(context, fontSize:35.spMin),
              color: AppColors.current.blueBackground),
        ),
        Image(
          image: const AssetImage(
            Assets.login,
          ),
          width: MediaQuery.sizeOf(context).width*0.4,
          height: MediaQuery.sizeOf(context).height*0.8,
        ),
      ],
    );
  }
}
