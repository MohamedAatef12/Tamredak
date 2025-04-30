import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/controllers/add_nurse_controller.dart';
import 'package:tamredak/features/mobile_layout/add_nurse/presentation/views/widgets/add_nurse_form.dart';

class AddNurseBody extends StatelessWidget {
  const AddNurseBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewNurseController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          CustomContainer(
            image: const Image(
              image: AssetImage(
                Assets.card1home,
              ),
            ),
            text: 'Add New Nurse',
            color: AppColors.current.greenButtons,
          ),
          20.verticalSpace,
          const AddNurseForm(),
          15.verticalSpace,
        ],

      ),
    );
  }
}
