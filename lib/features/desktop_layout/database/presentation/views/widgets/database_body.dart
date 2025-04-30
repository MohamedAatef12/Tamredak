import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/database/presentation/views/widgets/desktop_database_container.dart';

class DesktopDataBaseBody extends StatelessWidget {
  const DesktopDataBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: AppColors.current.blueBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DesktopDatabaseContainer(
              text: 'Latest Transactions',
              color: AppColors.current.purpleText,
              image: Assets.database,
            ),
          ],
        ),
      ),
    );
  }
}
