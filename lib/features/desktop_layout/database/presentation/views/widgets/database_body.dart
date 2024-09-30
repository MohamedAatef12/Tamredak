import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/database/presentation/views/widgets/desktop_database_container.dart';

class DataBaseBody extends StatelessWidget {
  const DataBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .9,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
            color: AppColors.current.primary,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DesktopDatabaseContainer(
              text: 'مراجعة المعاملات السابقة',
              color: AppColors.current.purpleText,
              image: Assets.database,
            ),
          ],
        ),
      ),
    );
  }
}
