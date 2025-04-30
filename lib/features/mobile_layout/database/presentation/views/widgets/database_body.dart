import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/views/widgets/database_list.dart';

class DataBaseBody extends StatelessWidget {
  const DataBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainer(
            image: const Image(
              image: AssetImage(
                Assets.database,
              ),
            ),
            text: 'Last Transactions',
            color: AppColors.current.purpleText,
          ),
        10.verticalSpace,
          const DataBaseList()
        ],
      ),
    );
  }
}
