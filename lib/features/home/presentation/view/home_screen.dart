import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/home/presentation/view/widgets/home_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'تمريضك',
            style: Styles.textStyleBold
                .copyWith(color: AppColors.current.white, fontSize: 24),
          )),
          backgroundColor: AppColors.current.primary,
        ),
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          color: AppColors.current.primary,
          child: const HomeBody(),
        ));
  }
}
