import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_form.dart';
import 'package:tamredak/features/desktop_layout/desktop_edit_profile/presentation/views/widgets/desktop_edit_profile_form.dart';

class DesktopEditProfileContainer extends StatelessWidget {
  const DesktopEditProfileContainer(
      {super.key,
        required this.text,
        required this.color,
        required this.image, required this.nurse});
  final String text;
  final Color color;
  final String image;
  final Map<String, dynamic> nurse;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        height: MediaQuery.sizeOf(context).height * 0.85,
        decoration: BoxDecoration(
            color: AppColors.current.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        text,
                        maxLines: 3,
                        style: Styles.textStyleMedium.copyWith(
                            fontSize:
                            responsiveFonts(context, fontSize: 22.spMin),
                            color: color),
                        overflow: TextOverflow.ellipsis,
                      )),
                  40.verticalSpace,
                  Image(
                      image: AssetImage(image),
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.2)
                ],
              ),
              const Spacer(),
              DesktopEditProfileForm(nurse: nurse,),
            ],
          ),
        ),
      ),
    );
  }
}
