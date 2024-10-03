import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.prefix,
      this.type,
      this.suffix,
      this.onSubmit,
      this.onChange,
      this.labelStyle,
      this.onTap,
      this.validate,
      this.controller,
      this.decoration,
      this.isPassword = false,
      this.widgetSuffix,
      this.suffixColor,
      this.contentPadding,
      this.maxLine,
      this.color,
      bool? obscureText});
  final TextStyle? labelStyle;
  final String? label;
  final String? hint;
  final dynamic prefix;
  final TextInputType? type;
  final bool isPassword;
  final dynamic suffix;
  final Function? onSubmit;
  final void Function(String)? onChange;
  final Function? onTap;
  final Function? validate;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Widget? widgetSuffix;
  final Color? suffixColor;
  final EdgeInsets? contentPadding;
  final int? maxLine;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      child: TextFormField(
        style: TextStyle(color: AppColors.current.text),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        maxLines: maxLine,
        onChanged: (s) {
          return onChange!(s);
        },
        validator: (s) {
          return validate!(s);
        },
        decoration: InputDecoration(
            contentPadding: contentPadding,
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: widgetSuffix ?? (suffix),
            border: InputBorder.none,
            focusedBorder: InputBorder.none),
        cursorColor: AppColors.current.text,
      ),
    );
  }
}
