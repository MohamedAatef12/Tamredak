import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/all_nurses/presentation/views/widgets/all_nurses_list.dart';
class AllNursesBody extends StatelessWidget {
  const AllNursesBody({super.key});

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
                  Assets.card4home,
                ),
              ),
              text: 'رؤية الممرضين في النظام',
              color: AppColors.current.blueBackground,
            ),
            const SizedBox(height: 20,),
            const AllNursesList()
          ]
      ),
    );
  }
}
