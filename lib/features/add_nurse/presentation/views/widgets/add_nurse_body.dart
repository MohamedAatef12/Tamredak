import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/add_nurse/presentation/views/widgets/add_nurse_form.dart';
class AddNurseBody extends StatelessWidget {
  const AddNurseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          CustomContainer(
            image: const Image(
              image: AssetImage(
                Assets.card1home,
              ),
            ),
              text: 'اضافة ممرض جديد للنظام',
              color: AppColors.current.greenButtons,
          ),
          const SizedBox(height: 20,),
          const AddNurseForm()
        ],
      ),
    );
  }
}
