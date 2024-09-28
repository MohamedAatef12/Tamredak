import 'package:flutter/material.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/core/utils/widgets/custom_container.dart';
import 'package:tamredak/features/mobile_layout/edit_profile/presentation/views/widgets/edit_profile_form.dart';
class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key, required this.nurse});
  final Map<String, dynamic> nurse;
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
                Assets.editProfile,
              ),
            ),
            text: 'تعديل الصفحة الشخصية للمرض',
            color: AppColors.current.veryDarkPurple,
          ),
          const SizedBox(height: 20,),
           EditProfileForm(nurse:nurse),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
