import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/utils/styles.dart';
import 'package:tamredak/features/desktop_layout/in%20task_nurse/presentation/views/widgets/desktop_in_task_list.dart';

class DesktopInTaskNurseContainer extends StatelessWidget {
  const DesktopInTaskNurseContainer(
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
      width: MediaQuery.sizeOf(context).width * .8,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.verticalSpace,
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
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.22)
              ],
            ),
          ),
          const Spacer(),
          const DesktopInTaskNurseList(),
          5.horizontalSpace
        ],
      ),
    );
  }
}
