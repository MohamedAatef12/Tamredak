import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/mobile_layout/in_task_nurses/presentation/view/widgets/in_task_nurses_list.dart';
class InTaskBody extends StatelessWidget {
  const InTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            CustomContainer(
              image: const Image(
                image: AssetImage(
                  Assets.card3home,
                ),
              ),
              text: 'In Task Nurses',
              color: AppColors.current.purpleText,
            ),
            const SizedBox(height: 20,),
            const InTaskList()
          ]
      ),
    );
  }
}
