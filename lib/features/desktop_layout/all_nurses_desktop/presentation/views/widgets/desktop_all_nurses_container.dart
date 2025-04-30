import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/themes/app_colors.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/widgets/desktop_all_nurses_list.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/view/widgets/desktop_available_nurse_list.dart';

class DesktopAllNurseContainer extends StatelessWidget {
  const DesktopAllNurseContainer(
      {super.key,
        required this.text,
        required this.color,
        required this.image});
  final String text;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.75,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
          color: AppColors.current.white,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
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
                          responsiveFonts(context, fontSize: MediaQuery.sizeOf(context).width * 0.015),
                          color: color),
                      overflow: TextOverflow.ellipsis,
                    )),
                40.verticalSpace,
                Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.15)
              ],
            ),
            const Spacer(),
            const DesktopAllNurseList(),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
