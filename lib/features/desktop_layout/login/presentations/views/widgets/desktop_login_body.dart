import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/styles.dart';

class DesktopLoginBody extends StatelessWidget {
  const DesktopLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مرحبا بك 👋',
              textAlign: TextAlign.center,
              style: Styles.textStyleBold.copyWith(
                  fontSize: responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width*0.025),
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
        )
      ],
    );
  }
}
