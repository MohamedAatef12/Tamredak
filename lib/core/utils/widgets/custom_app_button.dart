import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.text,
    this.onTap,

    required this.textFont, required this.height, required this.width,
  });
  final String text;
  final void Function()? onTap;
  final double height;
  final double width;
  final double textFont;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Center(
          child: Text(
        text,
        style: Styles.textStyleBold.copyWith(
          fontSize: responsiveFonts(context, fontSize: textFont),
          color: AppColors.current.white,
        ),
      )),
    );
  }
}
