import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/database/presentation/views/widgets/database_list.dart';

class DataBaseBody extends StatelessWidget {
  const DataBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomContainer(
              image: const Image(
                image: AssetImage(
                  Assets.database,
                ),
              ),
              text: 'مراجعة المعاملات السابقة',
              color: AppColors.current.purpleText,
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: DataBaseList())
          ]),
    );
  }
}
