import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/home/presentation/view/widgets/home_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
                        'تمريضك',
                        style: Styles.textStyleBold
              .copyWith(color: AppColors.current.white, fontSize: 24.spMin),
                      ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.current.primary,
        ),
        body: const HomeBody());
  }
}
