import 'package:flutter/cupertino.dart';
import 'package:tamredak/core/utils/scale_factors.dart';

abstract class Styles {
  static const textStyleRegular = TextStyle(
    fontWeight: FontWeight.normal,
  );
  static const textStyleMedium = TextStyle(
    fontWeight: FontWeight.w400,
  );
  static const textStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
  );
}

double responsiveFonts(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 1;
  double upperLimit = fontSize * 2;

  return responsiveSize.clamp(lowerLimit, upperLimit);
}
