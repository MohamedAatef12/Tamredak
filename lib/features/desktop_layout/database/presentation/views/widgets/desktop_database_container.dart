import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/features/desktop_layout/database/presentation/views/widgets/database_list.dart';

class DesktopDatabaseContainer extends StatelessWidget {
  const DesktopDatabaseContainer(
      {super.key,
      required this.text,
      required this.color,
      required this.image});
  final String text;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .7,
        height: MediaQuery.sizeOf(context).height * 0.85,
        decoration: BoxDecoration(
            color: AppColors.current.white,
            borderRadius: BorderRadius.circular(20)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [DesktopDataBaseList()],
        ),
      ),
    );
  }
}
